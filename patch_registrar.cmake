# 1. Read the file content
file(READ ${INPUT} file_contents)

# 2. Search and Replace
# Using regex to replace all occurrences of 'search_pattern' with 'replace_value'
set(__search_pattern "void qml_register_types_")
set(__replace_value "#if !defined(QT_STATIC)\n#define Q_QMLTYPE_EXPORT Q_DECL_EXPORT\n#else\n#define Q_QMLTYPE_EXPORT\n#endif\nQ_QMLTYPE_EXPORT void qml_register_types_")
string(REPLACE "${__search_pattern}" "${__replace_value}" file_contents "${file_contents}")

# 3. Write the modified content back to the file
file(WRITE ${OUTPUT} "${file_contents}")
