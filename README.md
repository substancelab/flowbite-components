# Flowbite Components

[![Gem Version](https://badge.fury.io/rb/flowbite-components.svg)](https://rubygems.org/gems/flowbite-components)
[![Ruby Tests](https://github.com/substancelab/flowbite-components/workflows/Ruby/badge.svg)](https://github.com/substancelab/flowbite-components/actions)

Unofficial, open source implementation of [Flowbite](https://flowbite.com/) components for Rails applications, built using [ViewComponent](https://viewcomponent.org/).

Flowbite Components provides a comprehensive library of UI components following the Flowbite design system, implemented as Rails ViewComponents with full Tailwind CSS integration and dark mode support.

## Features

- **Full Flowbite Design System**: Faithful implementation of Flowbite components
- **Rails Native**: Built specifically for Rails using ViewComponent
- **Tailwind CSS Integration**: Seamless integration with Tailwind CSS
- **Dark Mode Support**: Built-in dark theme variants
- **Form Helpers**: Comprehensive form input components with validation states
- **Accessibility First**: ARIA attributes and semantic HTML
- **Type Safety**: Comprehensive test coverage and input validation

## Installation

Add the gem to your application's Gemfile:

```ruby
gem 'flowbite-components'
```

Then execute:

```bash
bundle install
```

### Configuration

Make sure you have Tailwind CSS installed in your Rails application. We recommend using the [tailwindcss-rails](https://github.com/rails/tailwindcss-rails) gem:

```ruby
gem "tailwindcss-rails", ">= 4.3.0"
```

### Flowbite Setup

Install Flowbite as an npm dependency:

```bash
npm install flowbite
```

Add Flowbite to your Tailwind CSS configuration. In your `app/assets/tailwind/application.css`:

```css
@import "flowbite/src/themes/default";
@plugin "flowbite/plugin";
@import "../builds/tailwind/flowbite_components";
```

## Usage examples

### Basic Form Field

```erb
<% form_with model: @user do |form| %>
  <%= render Flowbite::InputField::Text.new(
    attribute: :name,
    form: form,
    label: {content: "Full Name"},
    hint: {content: "Enter your full name"}
  ) %>

  <%= render Flowbite::InputField::Email.new(
    attribute: :email,
    form: form
  ) %>

  <%= render Flowbite::Button.new(
    type: :submit,
    content: "Save User"
  ) %>
<% end %>
```

### Button Examples

```erb
<!-- Default button -->
<%= render Flowbite::Button.new do %>
  Click me
<% end %>

<!-- Outline button with color -->
<%= render Flowbite::Button::Outline.new(style: :blue) do %>
  Outline Button
<% end %>

<!-- Pill button -->
<%= render Flowbite::Button::Pill.new(style: :green) do %>
  Pill Button
<% end %>
```

### Custom Input Options

```erb
<%= render Flowbite::InputField::Text.new(
  attribute: :username,
  form: form,
  size: :lg,
  input: {
    options: {
      placeholder: "Enter username",
      maxlength: 50,
      class: "custom-class"
    }
  }
) %>
```

### Custom Labels

```erb
<%= render Flowbite::InputField::Email.new(
  attribute: :email,
  form: form,
  label: {
    content: "Email Address",
    options: {class: "font-bold"}
  }
) %>
```

### Disabled and Error States

```erb
<!-- Disabled field -->
<%= render Flowbite::InputField::Text.new(
  attribute: :name,
  form: form,
  disabled: true
) %>

<!-- Field with hint -->
<%= render Flowbite::InputField::Password.new(
  attribute: :password,
  form: form,
  hint: "Must be at least 8 characters long"
) %>
```

## Available Components

### Form Components

#### Input Fields (Complete form fields with labels, hints, and error handling)
- **Checkbox**: `Flowbite::InputField::Checkbox`
- **Date**: `Flowbite::InputField::Date`
- **Email**: `Flowbite::InputField::Email`
- **File**: `Flowbite::InputField::File`
- **Number**: `Flowbite::InputField::Number`
- **Password**: `Flowbite::InputField::Password`
- **Phone**: `Flowbite::InputField::Phone`
- **Radio Button**: `Flowbite::InputField::RadioButton`
- **Select**: `Flowbite::InputField::Select`
- **Text**: `Flowbite::InputField::Text`
- **Textarea**: `Flowbite::InputField::Textarea`
- **URL**: `Flowbite::InputField::Url`

#### Basic Input Components (Input elements without labels or wrappers)
- **Checkbox**: `Flowbite::Input::Checkbox`
- **Date**: `Flowbite::Input::Date`
- **Email**: `Flowbite::Input::Email`
- **File**: `Flowbite::Input::File`
- **Number**: `Flowbite::Input::Number`
- **Password**: `Flowbite::Input::Password`
- **Phone**: `Flowbite::Input::Phone`
- **Radio Button**: `Flowbite::Input::RadioButton`
- **Select**: `Flowbite::Input::Select`
- **Textarea**: `Flowbite::Input::Textarea`
- **URL**: `Flowbite::Input::Url`

#### Form Utilities
- **Hint**: `Flowbite::Input::Hint`
- **Label**: `Flowbite::Input::Label`
- **Validation Error**: `Flowbite::Input::ValidationError`

### UI Components

#### Buttons
- **Button**: `Flowbite::Button` (default solid button)
- **Outline Button**: `Flowbite::Button::Outline`
- **Pill Button**: `Flowbite::Button::Pill`


## Development

After checking out the repo, run `bin/setup` to install dependencies.

To run tests:

```bash
bundle exec rake test
```

To check code style:

```bash
bundle exec rake standard
```

To install this gem onto your local machine:

```bash
bundle exec rake install
```

### Component Previews

This library includes Lookbook previews for all components. To view them:

1. Add Lookbook to your development dependencies
2. Run `rails server`
3. Visit `/rails/lookbook`

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/substancelab/flowbite-components](https://github.com/substancelab/flowbite-components).

### Development Guidelines

- All components should follow Flowbite design system specifications
- Use keyword arguments for component initialization
- Include comprehensive tests for all components
- Follow the existing naming conventions
- Ensure accessibility standards are met

## Support

- [Flowbite Documentation](https://flowbite.com/docs/)
- [ViewComponent Documentation](https://viewcomponent.org/)
- [Tailwind CSS Documentation](https://tailwindcss.com/docs)

## Other Flowbite component libraries

* https://flowbite-react.com/
* https://flowbite-svelte.com/
* https://flowbite-vue.com/

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
