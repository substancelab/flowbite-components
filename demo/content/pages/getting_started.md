---
order: 2
title: Getting started
---

## Installation

Add the gem to your application's Gemfile:

```ruby
gem "flowbite-components"
```

Then execute:

```bash
bundle install
```

### tailwindcss-rails

Tailwind needs to be able to look through your code in order to generate the final CSS file with the class names you actually use. To allow Tailwind to find CSS class names inside flowbite-components you need to use [tailwindcss-rails](https://github.com/rails/tailwindcss-rails) gem:

```ruby
gem "tailwindcss-rails", ">= 4.3.0"
```

### Flowbite Setup

Install Flowbite as an npm dependency:

```bash
yarn add flowbite
```

Add Flowbite to your Tailwind CSS configuration. In your `app/assets/tailwind/application.css`:

```css
@plugin "flowbite/plugin";
@import "flowbite/src/themes/default";
@import "../builds/tailwind/flowbite_components";
```

If you want to use one of the other [Flowbite themes](https://flowbite.com/docs/customize/theming/), change `@import "flowbite/src/themes/default";` accordingly.
