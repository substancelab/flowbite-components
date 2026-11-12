# Changes

All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## Unreleased

### Added

- Opt-in client-side behavior for components using the `behavior:` argument. Components render Flowbite's own markup by default (`:none`). Set `Flowbite::Components.default_behavior` to change the default for all components
- `Flowbite::Toast` supports `behavior: :stimulus`, dismissing the toast like flowbite.js does, using the `flowbite--toast` Stimulus controller
- Modal component, with sizes and a footer slot. With `behavior: :stimulus` it is shown and hidden like flowbite.js does, using the `flowbite--modal` and `flowbite--modal-trigger` Stimulus controllers. `Flowbite::Modal.trigger_options` renders the data attributes for elements showing, hiding, or toggling the modal
- `bin/rails generate flowbite_components:behavior toast modal` copies the Stimulus controllers for the given components into your application. The controllers require [stimulus-use](https://stimulus-use.dev)

## [0.4.0]

### Added

- Avatar component, with image, initials and placeholder icon fallbacks, sizes, shapes, border and status dot
- Spinner component
- Progress component
- Pagination component
- Rating component, including `Flowbite::Rating::Star` for the individual stars
- `Flowbite::Toast::CloseButton` component for the close button of toasts
- `Flowbite::Toast` accepts `button: {options: {...}}` for passing HTML options, e.g. data attributes, to the default close button, or a `button` slot for rendering your own
- Alert component

### Fixed

- `Flowbite::Card` no longer renders an empty `h5` element when card title is blank.

## [0.3.0]

### Added

* Badge component.
* Sidebar component.

### Fixed

* `:class` arguments to subcomponents (ie `hint` and `input`) of Flowbite::InputField are now forwarded correctly. If passed as `:class` the given value is added to the existing class names, if passed in `options[:class]` the existing class attribute is replaced.


## [0.2.0]

### Added

* Breadcrumb component, including Flowbite::Breadcrumb::Item with Flowbite::Breadcrumb::Item::First and Flowbite::Breadcrumb::Item::Current variants.
* DateTime input field components.
* Toast component.
* Ruby 4.0 support (no changes).

### Changed

* [BREAKING] The API of Flowbite::InputField::RadioButton now follows the same structure as the other components for hints. Instead of passing a String (`hint: "This is the hint"`) you now have to pass a Hash that's passed along to the Hint component (i.e. `hint: {content: "This is the hint"}`), allowing you to customize other options (eg HTML attributes like class) as well.
* [BREAKING] Flowbite::Input::Field has been renamed to Flowbite::Input. All individual input components now use that as their superclass. This matches the class hierarchy of Flowbite::InputField::* classes better and allows Flowbite::Input to automagically appear in the documentation.

### Fixed

* Flowbite::InputField classes now correctly add their options to the container element, so you can add id attributes or connect Stimulus controllers again.


## [0.1.4]

### Added

* Flowbite::Link component to render links.
* Flowbite::Card now displays a title via the title argument/slot.
* Improved error message when an unknown style is requested.
* Input-elements now support forms without an object; i.e. forms built with `form_tag` - not `form_for` or `form_with`.

### Changed

* [BREAKING] All components now use Flowbite 4 style classes. This adds the option for easier styling, uses semantic variant names, and keeps us up to date with Flowbite proper.
* Extra CSS classes passed to components in the `class` argument are now added to the default classes from the component. This optimizes for minor tweaks and additions, which is likely to be the most common use case. If you need to replace all classes on the root element of the component, pass them in `options[:class]` instead.

### Removed

* [BREAKING] Color-specific styles from Flowbite::Button, i.e. `alternative`, `green`, `light`, `purple`, `red`, `yellow`.


## [0.1.3]

### Added

* Options to Flowbite::InputField::Checkbox and Flowbite::Input::Checkbox that allow you to change the submitted value.
* Options added for Flowbite::Input::Select - :multiple and :include_blank. These can now be passed to either the input itself or Flowbite::InputField::Select


## [0.1.2]

### Added

* Button component (first component, wee!)
* Input components
* InputField components
* Basic Card component

[0.4.0]: https://github.com/substancelab/flowbite-components/releases/tag/v0.4.0
[0.3.0]: https://github.com/substancelab/flowbite-components/releases/tag/v0.3.0
[0.2.0]: https://github.com/substancelab/flowbite-components/releases/tag/v0.2.0
[0.1.4]: https://github.com/substancelab/flowbite-components/releases/tag/v0.1.4
[0.1.3]: https://github.com/substancelab/flowbite-components/releases/tag/v0.1.3
[0.1.2]: https://github.com/substancelab/flowbite-components/releases/tag/v0.1.2
[0.1.1]: https://github.com/substancelab/flowbite-components/releases/tag/v0.1.1
[0.1.0]: https://github.com/substancelab/flowbite-components/releases/tag/v0.1.0
