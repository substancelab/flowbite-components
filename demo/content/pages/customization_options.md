---
order: 4
title: Customization options
---

## How to customize components

### CSS classes are additive

Generally speaking, passing classes via the `class` argument to a component adds the classes to the default ones instead of replacing them.

```ruby
render(Component.new(class: "these are added"))
```

This makes for easier customization of components, where you don't have to recreate the entire classlist, i.e. in order to increase sizes or add margins or whatever.

If you want to replace the entire class attribute for a component, pass it as part of the `options` hash, ie

```ruby
render(Component.new(options: {class: "these replace the classes"}))
```

### Add specific CSS classes

A common use case for customizing a component is to add more CSS classes when rendering it, fx to change the size or spacing. flowbite-components is optimized for this case and all you need to do is specify the extra classes:

```erb
<%= render(Flowbite::Card.new(class: "w-full my-8")) { "Content" } %>
```
renders
```html
<div class="... all the usual classes... w-full my-8">
```

If you want to fully replace the existing classes, you can pass an entirely new
`class` attribute via options:

```erb
<%= render(Flowbite::Card.new(options: {class: "w-full my-8"})) { "Content" } %>
```
renders
```html
<div class="w-full my-8">
```
