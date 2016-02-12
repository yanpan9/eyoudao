#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libxml/parser.h>
#include <libxml/xmlerror.h>
#include <libxml/uri.h>
#include <libxslt/xslt.h>
#include <libxslt/xsltInternals.h>
#include <libxslt/transform.h>
#include <libxslt/xsltutils.h>

xmlChar *QUERYWORD = 0;
xmlChar *XMLAPI = 0;
xmlChar *XSLAPI = 0;
int check_argument(int argc,char *argv[]);
void do_xslt();

int
main(int argc,char *argv[])
{
	if (check_argument(argc,argv)) {
		return 1;
	}
	do_xslt();
	xmlFree(QUERYWORD);
	return 0;
}

int
check_argument(int argc,char *argv[])
{
	int i;
	for (i = 1;i < argc; ++i) {
		if (strcmp(argv[i],"-keyword") == 0) {
			++i;
			QUERYWORD = xmlPathToURI((const xmlChar*)argv[i]);
		} else if (strcmp(argv[i],"-xmlapi") == 0) {
			++i;
			XMLAPI = argv[i];
		} else if (strcmp(argv[i],"-xslapi") == 0) {
			++i;
			XSLAPI = argv[i];
		} else {
			xmlFree(QUERYWORD);
			printf("eyoudao check_argument unknow argument!\n");
			return 1;
		}
	}

	if (QUERYWORD == 0 || XMLAPI == 0 || XSLAPI == 0) {
		printf("eyoudao:check_argument unknow QUERYWORD!\n");
		return 1;
	}
	return 0;
}

void
do_xslt()
{
	xmlDocPtr doc,res;
	xsltStylesheetPtr cur;
	xmlErrorPtr errmsg = NULL;
	doc = res = NULL;
	cur = NULL;
	int success = 0;
	xmlSubstituteEntitiesDefault(1);
	xmlLoadExtDtdDefaultValue = 1;

	char tmp[1024];
	sprintf(tmp,"%s%s",XMLAPI,QUERYWORD);
	doc	= xmlReadFile(tmp,"utf-8",XML_PARSE_NOERROR);
	if (!doc)	goto end;

	cur = xsltParseStylesheetFile(XSLAPI);
	if (!cur)	goto end;

	res = xsltApplyStylesheet(cur, doc, NULL);
	if (!res)	goto end;

	if (xsltSaveResultToFile(stdout, res, cur) == -1)	
		goto end;
	
	success = 1;
	//printf("%d\n",success);
end:
	if (!success) {
		errmsg = xmlGetLastError();
		printf("%s\n",errmsg ? errmsg->message : "");
		xmlResetLastError();
	}
	xsltFreeStylesheet(cur);
	xmlFreeDoc(res);
	xmlFreeDoc(doc);
	xsltCleanupGlobals();
	xmlCleanupParser();
	return;
}
