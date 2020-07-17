defmodule Smartsheet.Column.ColumnType do
  @abstract_datetime "ABSTRACT_DATETIME"
  @checkbox "CHECKBOX"
  @contact_list "CONTACT_LIST"
  @date "DATE"
  @datetime "DATETIME"
  @duration "DURATION"
  @multi_contact_list "MULTI_CONTACT_LIST"
  @multi_picklist "MULTI_PICKLIST"
  @picklist "PICKLIST"
  @predecessor "PREDECESSOR"
  @text_number "TEXT_NUMBER"

  def abstract_datetime, do: @abstract_datetime
  def checkbox, do: @checkbox
  def contact_list, do: @contact_list
  def date, do: @date
  def datetime, do: @datetime
  def duration, do: @duration
  def multi_contact_list, do: @multi_contact_list
  def multi_picklist, do: @multi_picklist
  def picklist, do: @picklist
  def predecessor, do: @predecessor
  def text_number, do: @text_number
end
