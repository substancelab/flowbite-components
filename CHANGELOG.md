# Changes

All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

### Added

* DateTime input field components.

### Changed

### Removed


## [0.1.4]

### Added

* Flowbite::Link component to render links.
* Flowbite::Card now displays a title via the title argument/slot.
* Improved error message when an unknown style is requested.
* Input-elements now support forms without an object; ie forms built with `form_tag` - not `form_for` or `form_with`.

### Changed

* [BREAKING] All components now use Flowbite 4 style classes. This adds the option for easier styling, uses semantic variant names, and keeps us up to date with Flowbite proper.
* Extra CSS classes passed to components in the `class` argument are now added to the default classes from the component. This optimizes for minor tweaks and additions, which is likely to be the most common use case. If you need to replace all classes on the root element of the component, pass them in `options[:class]` instead.

### Removed

* [BREAKING] Color-specific styles from Flowbite::Button, ie `alternative`, `green`, `light`, `purple`, `red`, `yellow`.


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
