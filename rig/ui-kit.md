# UI kit

What's installed, so seats reuse it instead of building their own. All live in `src/components/`.
Add more with `npx shadcn add @ai-elements/<name>` or `npx shadcn add @magicui/<name>`
(`npx shadcn search @magicui` lists them). Base UI primitives, not Radix: menu items use `onClick`.

## shadcn (`ui/`)
badge, button, button-group, collapsible, command, dialog, dropdown-menu, hover-card, input,
input-group, scroll-area, select, separator, spinner, textarea, tooltip (app already wrapped in
`TooltipProvider`). Charts: `npx shadcn add chart`.

## AI Elements (`ai-elements/`) — chat and agent UI
| Component | Use it for |
|---|---|
| conversation | scrolling chat container, stick-to-bottom |
| message | one chat turn, renders streamed markdown |
| prompt-input | input box with attachments, model select, submit/stop |
| reasoning | collapsible "thinking" block |
| tool | a tool call with its input and output |
| sources | cited links under an answer |
| suggestion | clickable starter prompts |
| code-block | highlighted code with copy |
| shimmer | loading text |

Pairs with the `ai` package (`useChat`). Not installed yet: `@ai-sdk/react`; add it with the slice that needs chat.

## Magic UI (`ui/`) — demo polish
| Component | Use it for |
|---|---|
| marquee | scrolling logos or quotes |
| border-beam | animated border on a hero card |
| shimmer-button | the one main call to action |
| number-ticker | counting-up stats |
| animated-beam | lines between nodes (data flow diagram) |
| bento-grid | feature grid on the landing page |
| blur-fade | fade-in on scroll |
| dot-pattern | background texture |
| confetti | success moment in the demo |
| text-animate | animated headline |

Use motion for the demo's two or three key moments, not everywhere.
