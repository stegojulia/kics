package Cx

import data.generic.openapi as openapi_lib

CxPolicy[result] {
	doc := input.document[i]
	openapi_lib.check_openapi(doc) != "undefined"
	response := doc.paths[n][oper].responses
	oper == "trace"

	object.get(response, "200", "undefined") == "undefined"

	result := {
		"documentId": doc.id,
		"searchKey": sprintf("paths.{{%s}}.{{%s}}.responses", [n, oper]),
		"issueType": "MissingAttribute",
		"keyExpectedValue": "Trace should have the '200' successful code set",
		"keyActualValue": "Trace does not have the '200' successful code set",
	}
}
