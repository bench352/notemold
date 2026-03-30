---
name: notemold-beta
description: Formulate a user-provided Markdown or plaintext document into a completed document based on placeholders defined with the **NoteMold** notation system, which uses braces `{}` as placeholders.
compatibility: Tested with OpenCode. May work with other Agent Skills compatible Agentic AI tools.
license: MIT
---

# NoteMold Formulator

**NoteMold** is a **Markdown-compatible notation system** that turns a regular Markdown/plaintext note into a dynamic template. It adopts a syntax that is easy to read and write in natural language, making it digestible for both humans and LLMs.

## Instructions

1. Read and fully understand the **Syntax guide** below.
2. Parse the provided note carefully.
3. Fill every placeholder using context, your knowledge, or quick online info when needed.
4. Process all logical blocks and enumerations logically.
5. **Output ONLY the final clean, formulated text** (no explanations, no "Here is the result", unless the user specifically asks for steps).

## Syntax guide

Any text wrapped with braces `{...}` is a **Placeholder** for substituting text when templating. Use it as a context-specific "fill-in-the-blanks" (e.g., `{your name}` -> `Chris Wong`, `John Doe`, etc.).

Once the Placeholder is replaced by a concrete value, it is considered "formulated".

### Logical Placeholder

Logical Placeholders wrap a section of text and indicate the condition or frequency of a text/placeholder populate in a formulated text. A Logical Placeholder does not work as "fill-in-the-blanks" on their own.

Logical Placeholders are wrapped with double braces `{{...}}`, and indicated by reserved keyword(s) immediately following `{{`. Each Logical Placeholder holds a natural language description of how to iterate or populate the wrapped text.

Supported **logical placeholders** include:

#### For loop

**Syntax**

```markdown
{{For each ...}}
- ...
{{End for}}
```

**Usage**

Generate a list of templated items over a list/set of items.

**Example**

```markdown
{{For each inter-city transportation required for this trip}}
- [ ] Buy ticket for {inter-city transportation} from {start location} to {destination}
{{End for}}
```

**Output example**

```markdown
- [ ] Buy ticket for train from Malang to Surabaya
- [ ] Buy ticket for flight from Surabaya to Bali
```

#### If clause

**Syntax**

```markdown
{{If ...}}
...
{{Else if ...}}
...
{{Else}}
...
{{End if}}
```

**Usage**

Conditionally include section of text.

**Example**

```markdown
{{If everyone finishes their speech on time}}
All contestants finish their speech within the time requirement. Well done!
{{Else}}
Unfortunately, {X} contestants are disqualified because their speeches do not meet the time requirement.
{{End if}}
```

**Output example**

```markdown
All contestants finish their speech within the time requirement. Well done!
```

or

```markdown
Unfortunately, 2 contestants are disqualified because their speeches do not meet the time requirement.
```

#### Formatting guide

Indentation is not required for nested logical placeholders, but could be helpful for readability. If you *really* need to handle very complex nested logical expressions and want them to look readable, you can:

 - Keep the first pair of reserved keywords at the same indentation level.
 - Move the next pair of reserved keywords **two spaces deeper** (one level indented).
 - **Always** keep any wrapped placeholders or static text at their **original indentation**.

 For example:
 
 ```markdown
 {{If ...}}
   {{For each ...}}
 - {placeholder}
   {{End for}}
 {{End if}}
 ```

### Enumeration

Use enumeration to provide a set of static text for the user to fill in the blanks.

**Syntax**

`{(Option 1) / (Option 2) / ...}`

Where `Option 1`, `Option 2`, ... are one of the actual texts users can choose as the value of the placeholder.

**Example**

```markdown
- [ ] Buy {(SIM card) / (Roaming package)} for {the country}
```

**Output example**

```markdown
- [ ] Buy SIM card for Japan
```

or 

```markdown
- [ ] Buy Roaming package for Japan
```

#### Enumeration with placeholder

Enumeration can have placeholders within it too to make it more flexible. All it takes to wrap the placeholder with `{}` within the enumeration item. For example:

```markdown
I am travelling {(alone) / (with {X} person)}
```

Gives:

```markdown
I am travelling alone.
```

or

```markdown
I am travelling with 3 person.
```