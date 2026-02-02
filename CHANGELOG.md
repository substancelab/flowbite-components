# Changes

All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

### Added

* Breadcrumb component, including Flowbite::Breadcrumb::Item with Flowbite::Breadcrumb::Item::First and Flowbite::Breadcrumb::Item::Current variants.
* DateTime input field components.
* Toast component.
* Ruby 4.0 support (no changes).

### Changed

* [BREAKING] The API of Flowbite::InputField::RadioButton now follows the same structure as the other components for hints. Instead of passing a String (`hint: "This is the hint"`) you now have to pass a Hash that's passed along to the Hint component (i.e. `hint: {content: "This is the hint"}`), allowing you to customize other options (eg HTML attributes like class) as well.

### Fixed

* Flowbite::InputField classes now correctly add their options to the container element, so you can add id attributes or connect Stimulus controllers again.

### Removed


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
