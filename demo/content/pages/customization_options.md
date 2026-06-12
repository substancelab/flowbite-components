---
order: 4
title: Customization options
---

## Add extra CSS classes to an element

A common use case for customizing a component is to add more CSS classes when rendering it, fx to change the size or spacing. flowbite-components is optimized for this case and all you need to do is specify the extra classes.

Generally speaking, passing classes via the `class` argument to a component adds the classes to the default ones instead of replacing them.

### Example

```erb
<%= render(Flowbite::Card.new(class: "w-full my-8")) { "Content" } %>
```

renders

```html
<div class="... all the usual classes... w-full my-8">
```

## Replace all default classes

If you want to fully replace the existing classes, you can pass an entirely new `class` attribute via options.

### Example

```erb
<%= render(Flowbite::Card.new(options: {class: "w-full my-8"})) { "Content" } %>
```

renders

```html
<div class="w-full my-8">
```

## Add CSS classes to components with slots

The above is also true for components that render subelements via slots, in particular [`Flowbite::InputField`](/docs/components/Flowbite::InputField) where `hint`, `input`, and `label` can be customized this way.

When passing values to the `class` argument of input, ie

```erb
<%= render(Flowbite::InputField::Text.new(..., input: {class: "adds-to-classes"}))` %>
```

the resulting HTML includes

```html
<input ... class="... all the usual classes ...  adds-to-classes" ...>
```

On the other hand, if you want to replace the entire class list, the `class` attribute can be set via `options`:

```erb
<%= render(Flowbite::InputField::Text.new(..., input: {options: {class: "replaces-classes"}})) %>
```

which results in

```html
<input ... class="replaces-classes" ...>
```
