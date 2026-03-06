#!/usr/bin/env node
const fs = require("fs");
const path = require("path");

const SKILLS_DIR = path.join(__dirname, "..", "skills");

function parseFrontmatter(raw) {
  const lines = raw.split("\n");
  if (lines[0]?.trim() !== "---") return { meta: {}, body: raw };

  let endIndex = -1;
  for (let i = 1; i < lines.length; i++) {
    if (lines[i].trim() === "---") { endIndex = i; break; }
  }
  if (endIndex === -1) return { meta: {}, body: raw };

  const meta = {};
  let currentKey = "";

  for (let i = 1; i < endIndex; i++) {
    const line = lines[i];
    if (/^\s+-\s+/.test(line) && currentKey) {
      const value = line.replace(/^\s+-\s+/, "").trim();
      if (Array.isArray(meta[currentKey])) meta[currentKey].push(value);
      else meta[currentKey] = [value];
      continue;
    }
    const match = line.match(/^(\w+):\s*(.*)/);
    if (match) {
      currentKey = match[1];
      const val = match[2].trim().replace(/^["']|["']$/g, "");
      if (val) meta[currentKey] = val;
    }
  }

  return { meta, body: lines.slice(endIndex + 1).join("\n").trim() };
}

function interpolate(template, extraVars) {
  const now = new Date();
  const today = now.toISOString().split("T")[0];
  const vars = {
    today,
    now: now.toISOString(),
    repo: process.env.GITHUB_REPOSITORY || "aeon",
    ...extraVars,
  };
  return template.replace(/\$\{(\w+)\}/g, (_, key) => vars[key] ?? "${" + key + "}");
}

function toArray(val) {
  if (!val) return [];
  return Array.isArray(val) ? val : [val];
}

function loadSkill(name) {
  const raw = fs.readFileSync(path.join(SKILLS_DIR, name + ".md"), "utf-8");
  const { meta, body } = parseFrontmatter(raw);

  const vars = {};
  for (const entry of toArray(meta.vars)) {
    const eq = entry.indexOf("=");
    if (eq > 0) vars[entry.slice(0, eq).trim()] = entry.slice(eq + 1).trim();
  }

  return {
    name: meta.name || name,
    schedule: meta.schedule || "",
    commits: toArray(meta.commits),
    prompt: interpolate(body, vars),
  };
}

function listSkills() {
  return fs.readdirSync(SKILLS_DIR)
    .filter(f => f.endsWith(".md"))
    .map(f => f.replace(/\.md$/, ""));
}

// CLI
const args = process.argv.slice(2);
const flag = args[0];
const value = args[1];

if (flag === "--find-by-cron") {
  const match = listSkills().find(s => loadSkill(s).schedule === value);
  if (!match) { console.error("No skill matches cron '" + value + "'"); process.exit(1); }
  process.stdout.write(match);
} else if (flag === "--prompt") {
  process.stdout.write(loadSkill(value).prompt);
} else if (flag === "--commits") {
  process.stdout.write(loadSkill(value).commits.join(" "));
} else if (flag === "--list") {
  console.log(listSkills().join("\n"));
} else {
  console.error("Usage: load-skill.js --prompt|--commits|--find-by-cron|--list <value>");
  process.exit(1);
}
