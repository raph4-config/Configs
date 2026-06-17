# espanso

Text-expansion config. Themed match files under `match/`, profile in `config/default.yml`. Synced to espanso's config dir by `sync.sh`.

`$|$` in a snippet marks where the cursor lands after expansion.

## Pro — `pro.yml` (prefix `;`)

| Trigger | Expands to |
|---------|------------|
| `;mail` | arn@ibanfirst.com |
| `;ooo` | out-of-office auto-reply (English) |
| `;rev` | share a PR for review |
| `;wip` | "I'm on it" |
| `;done` | "it's done" |
| `;dispo` | ask for 2 minutes |
| `;ack` | acknowledge receipt |
| `;thx` | thanks |
| `;hi` | message opener |
| `;relance` | follow-up reminder |
| `;call` | suggest a quick call |
| `;clar` | ask for clarification |
| `;nope` | politely decline a slot |
| `;blok` | flag a blocker |
| `;recap` | meeting recap |
| `;cu` | closing line |

## SQL Snowflake — `sql.yml` (prefix `;q`)

| Trigger | Expands to |
|---------|------------|
| `;qsel` | `SELECT * FROM` |
| `;qcnt` | `SELECT COUNT(*) FROM` |
| `;qd2d` | `::DATE` (datetime → date) |
| `;qtodate` | `TO_DATE()` |
| `;qtrunc` | `DATE_TRUNC('month', )` |
| `;qdadd` | `DATEADD('day', 1, )` |
| `;qddiff` | `DATEDIFF('day', , )` |
| `;qcdate` | `CURRENT_DATE` |
| `;qcts` | `CURRENT_TIMESTAMP()` |
| `;qlimit` | `LIMIT 100` |

## Python — `python.yml` (prefix `;p`)

| Trigger | Expands to |
|---------|------------|
| `;pmain` | `if __name__ == "__main__":` |
| `;pdef` | function definition |
| `;pcls` | class with `__init__` |
| `;plog` | module logger setup |
| `;ptry` | try / except block |
| `;pf` | f-string `f""` |
| `;pbp` | `breakpoint()` |
| `;plc` | list comprehension |

## Emojis — `emoji.yml`

Three distinct prefixes, no overlap.

### Dev (`;;`)
| `;;rocket` 🚀 | `;;sparkle` ✨ | `;;bug` 🐛 | `;;fire` 🔥 | `;;check` ✅ |
|---|---|---|---|---|
| `;;wrench` 🔧 | `;;recycle` ♻️ | `;;warn` ⚠️ | `;;memo` 📝 | `;;boom` 💥 |

### Teams (`@@`)
| `@@up` 👍 | `@@down` 👎 | `@@ok` 👌 | `@@eyes` 👀 | `@@party` 🎉 |
|---|---|---|---|---|
| `@@think` 🤔 | `@@pray` 🙏 | `@@clap` 👏 | `@@100` 💯 | `@@muscle` 💪 |

### Normal (`::`)
| `::smile` 😄 | `::laugh` 😂 | `::wink` 😉 | `::cool` 😎 | `::love` 😍 |
|---|---|---|---|---|
| `::wow` 😮 | `::sad` 😞 | `::cry` 😢 | `::heart` ❤️ | |
