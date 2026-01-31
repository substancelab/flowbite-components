# frozen_string_literal: true

# YARD plugin for documenting ViewComponent slots
#
# This plugin adds a @viewcomponent_slot tag that can be used to document
# slots defined with renders_one and renders_many in ViewComponent classes.
#
# Usage:
#   # @viewcomponent_slot [Flowbite::Card::Title] title The title of the card
#   renders_one :title
#
#   # @viewcomponent_slot [Flowbite::Breadcrumb::Item] items The breadcrumb items
#   renders_many :items
#
# The tag accepts:
#   - Types (optional): The component class(es) that can be rendered in the slot
#   - Name (required): The slot name (matching the symbol passed to renders_one/renders_many)
#   - Description (optional): A description of what the slot is for

YARD::Tags::Library.define_tag(
  "ViewComponent Slot",
  :viewcomponent_slot,
  :with_types_and_name
)
