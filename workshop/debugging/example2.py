src :https://github.com/prontohousing/pronto-thor/commit/9e34fb462807f3500ee55bfc861405be586808a6


ORIG:

if document_data.min_weight < doc.min_weight or document_data.hhms > doc.hhms or (document_data.survey_file is not None and document_data.survey_file.survey_file_date is not None and document_data.survey_file.survey_file_date < doc.survey_file.survey_file_date):

NEW:

has_new_document_lower_hhmt_weight = document_data.min_weight < doc.min_weight
has_new_document_higher_hhms_quantity = document_data.hhms > doc.hhms
has_new_document_survey_file_date = document_data.survey_file is not None and document_data.survey_file.survey_file_date is not None
has_old_document_suvery_file_date = doc.survey_file.survey_file_date
has_new_document_lower_survey_file_date = has_new_document_survey_file_date and has_old_document_suvery_file_date and document_data.survey_file.survey_file_date < doc.survey_file.survey_file_date

if has_new_document_lower_hhmt_weight or has_new_document_higher_hhms_quantity or has_new_document_lower_survey_file_date:
