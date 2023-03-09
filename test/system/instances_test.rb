require "application_system_test_case"

class InstancesTest < ApplicationSystemTestCase
  setup do
    @instance = instances(:one)
  end

  test "visiting the index" do
    visit instances_url
    assert_selector "h1", text: "Instances"
  end

  test "should create instance" do
    visit instances_url
    click_on "New instance"

    fill_in "Name", with: @instance.name
    click_on "Create Instance"

    assert_text "Instance was successfully created"
    click_on "Back"
  end

  test "should update Instance" do
    visit instance_url(@instance)
    click_on "Edit this instance", match: :first

    fill_in "Name", with: @instance.name
    click_on "Update Instance"

    assert_text "Instance was successfully updated"
    click_on "Back"
  end

  test "should destroy Instance" do
    visit instance_url(@instance)
    click_on "Destroy this instance", match: :first

    assert_text "Instance was successfully destroyed"
  end
end
