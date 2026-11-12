#import "../../../core/templates/yml.typ": yml_resume

#let resume_data = yaml("resume.yaml")
#yml_resume(
  resume_data,
  line_gap: 0.96em,
  section_gap: 1.23em,
  header_gap: 1.78em
)
