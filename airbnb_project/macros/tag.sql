{% macro tag(col) %}
  case
    when {{col}} is null then null
    when {{ col }} < 100 then 'low'
    when {{ col }} < 200 then 'medium'
    else 'high'
  end
{% endmacro %}

{#
below won't work becasue jinja replace col with a string, not the column
  {% if col < 100 %}
    low
  {% elif col < 200 %}
    medium
  {% else %}
    high
  {% endif %}
#}