INSERT INTO cdm_project_model_1_0_0_20230418.visits_drug_order(
genesis_create_time,
genesis_upd,
genesis_del,
genesis_new_id,
org_code,
patient_sn_original,
visit_sn,
order_sn,
parent_order_sn,
drug_code,
order_start_time,
order_stop_time,
order_confirmor_time,
approved_drug_name,
drug_generic_name,
drug_specification,
drug_amount,
drug_unit_code,
drug_doseage,
drug_doseage_unit_code,
freq_code,
freq_name,
method_code,
method_name,
drug_dosage,
drug_dosage_code,
drug_firm,
drug_atc,
drug_atc_name,
drug_ddd,
drug_license,
order_describe,
order_dept_code,
order_dept,
order_time,
ward_code,
ward_name,
exec_dept_code,
exec_dept,
order_status_code,
delete_flag,
delete_time,
order_verify_time,
order_verify_physician_code,
order_verify_physician_name,
order_start_physician_code,
order_start_physician_name,
order_execute_time,
order_execute_code,
order_execute_name,
order_cancel_code,
order_cancel_name,
order_stop_physician_code,
order_stop_physician_name,
order_confirmor_nurse_code,
order_confirmor_nurse,
order_stop_nurse_code,
order_stop_nurse_name,
order_status_name,
long_once_flag,
drug_unit_name,
skin_test_flag,
drug_doseage_unit_name,
clinical_pathway_flag,
data_status,
org_name,
data_sources
)

SELECT
CURRENT_TIMESTAMP() as genesis_create_time,
a.genesis_upd,
a.genesis_del,
a.genesis_new_id,
'43523216961011311A1001' AS ORG_CODE , -- 医疗机构编码
B.CARD_NO AS PATIENT_SN_ORIGINAL , -- 原始患者编号
A.INPATIENT_NO AS VISIT_SN , -- 就诊编号
A.MO_ORDER AS ORDER_SN , -- 医嘱编号
A.COMB_NO AS PARENT_ORDER_SN , -- 父医嘱号
A.ITEM_CODE AS DRUG_CODE , -- 药物编码
A.DATE_BGN AS ORDER_START_TIME , -- 医嘱开始时间
(CASE WHEN A.DATE_END > date_format('2000-01-01','yyyy-MM-dd') THEN A.DATE_END ELSE NULL END) AS ORDER_STOP_TIME , -- 医嘱停止时间
(CASE WHEN A.CONFIRM_DATE > date_format('2000-01-01','yyyy-MM-dd') THEN A.CONFIRM_DATE ELSE NULL END) AS ORDER_CONFIRMOR_TIME , -- 医嘱确认时间
C.TRADE_NAME AS APPROVED_DRUG_NAME , -- 药物商品名
C.REGULAR_NAME AS DRUG_GENERIC_NAME , -- 药物通用名称
A.SPECS AS DRUG_SPECIFICATION , -- 药物规格
D.QTY_TOT AS DRUG_AMOUNT , -- 用药数量
A.PRICE_UNIT AS DRUG_UNIT_CODE , -- 用药单位编码
A.BASE_DOSE AS DRUG_DOSEAGE , -- 药物剂量
F.CODE AS DRUG_DOSEAGE_UNIT_CODE , -- 药物剂量单位代码
A.FREQUENCY_CODE AS FREQ_CODE , -- 频率代码
A.FREQUENCY_NAME AS FREQ_NAME , -- 频率名称
A.USAGE_CODE AS METHOD_CODE , -- 用药途径代码
A.USE_NAME AS METHOD_NAME , -- 用药途径名称
G.NAME AS DRUG_DOSAGE , -- 药物剂型
A.DOSE_MODEL_CODE AS DRUG_DOSAGE_CODE , -- 药物剂型代码
E.FAC_NAME AS DRUG_FIRM , -- 药品厂商
'' AS DRUG_ATC , -- ATC分类码
'' AS DRUG_ATC_NAME , -- ATC分类名称
C.DDD AS DRUG_DDD , -- DDD值
C.APPROVE_INFO AS DRUG_LICENSE , -- 批准文号
A.ITEM_NAME AS ORDER_DESCRIBE , -- 医嘱描述
A.LIST_DPCD AS ORDER_DEPT_CODE , -- 下嘱科室编码
H.DEPT_NAME AS ORDER_DEPT , -- 下嘱科室名称
A.MO_DATE AS ORDER_TIME , -- 下嘱时间
A.NURSE_CELL_CODE AS WARD_CODE , -- 病区编码
I.DEPT_NAME AS WARD_NAME , -- 病区名称
A.EXEC_DPCD AS EXEC_DEPT_CODE , -- 执行科室编码
A.EXEC_DPNM AS EXEC_DEPT , -- 执行科室名称
A.MO_STAT AS ORDER_STATUS_CODE , -- 医嘱状态编码
'' AS DELETE_FLAG , -- 撤销标识
'' AS DELETE_TIME , -- 撤销时间
(CASE WHEN A.DC_CONFIRM_DATE > date_format('2000-01-01','yyyy-MM-dd') THEN A.DC_CONFIRM_DATE ELSE NULL END) AS ORDER_VERIFY_TIME , -- 医嘱审核日期
A.DC_CONFIRM_OPER AS ORDER_VERIFY_PHYSICIAN_CODE , -- 医嘱审核人编码
J.EMPL_NAME AS ORDER_VERIFY_PHYSICIAN_NAME , -- 医嘱审核人签名
A.DOC_CODE AS ORDER_START_PHYSICIAN_CODE , -- 开嘱医生编码
A.DOC_NAME AS ORDER_START_PHYSICIAN_NAME , -- 开嘱医生姓名
D.EXEC_DATE AS ORDER_EXECUTE_TIME , -- 医嘱执行时间
D.EXEC_USERCD AS ORDER_EXECUTE_CODE , -- 医嘱执行者编码
K.EMPL_NAME AS ORDER_EXECUTE_NAME , -- 医嘱执行者签名
'' AS ORDER_CANCEL_CODE , -- 取消医嘱者编码
'' AS ORDER_CANCEL_NAME , -- 取消医嘱者签名
A.DC_DOCCD AS ORDER_STOP_PHYSICIAN_CODE , -- 停嘱医生编码
A.DC_DOCNM AS ORDER_STOP_PHYSICIAN_NAME , -- 停嘱医生姓名
A.CONFIRM_USERCD AS ORDER_CONFIRMOR_NURSE_CODE , -- 确认护士编码
L.EMPL_NAME AS ORDER_CONFIRMOR_NURSE , -- 确认护士名称
'' AS ORDER_STOP_NURSE_CODE , -- 停嘱护士编码
'' AS ORDER_STOP_NURSE_NAME , -- 停嘱护士名称
(CASE A.MO_STAT WHEN '0' THEN '开立' WHEN '1' THEN '审核' WHEN '2' THEN '执行'
WHEN '3' THEN '作废' WHEN '4' THEN '重整' ELSE '' END) AS ORDER_STATUS_NAME , -- 医嘱状态名称
(CASE WHEN A.TYPE_CODE IN ('CZ','ZC') then '长期医嘱' ELSE '临时医嘱' END) AS LONG_ONCE_FLAG , -- 长期或临时
A.DOSE_UNIT AS DRUG_UNIT_NAME , -- 用药单位名称
(CASE WHEN A.HYPOTEST IN ('3','4') THEN '是' ELSE '否' END) AS SKIN_TEST_FLAG , -- 是否皮试
A.DOSE_UNIT AS DRUG_DOSEAGE_UNIT_NAME , -- 药物剂量单位名称
'' AS CLINICAL_PATHWAY_FLAG , -- 是否路径内
'' AS DATA_STATUS , -- 数据处理状态
'西安交通大学医学院第一附属医院' AS ORG_NAME , -- 医疗机构名称
'HIS' AS DATA_SOURCES -- 数据来源
FROM ods_project_model_20230407.MET_IPM_ORDER A
INNER JOIN ods_project_model_20230407.FIN_IPR_INMAININFO B ON A.INPATIENT_NO = B.INPATIENT_NO
LEFT JOIN ods_project_model_20230407.PHA_COM_BASEINFO C ON A.ITEM_CODE = C.DRUG_CODE
LEFT JOIN (SELECT INPATIENT_NO,MO_ORDER,SUM(QTY_TOT) AS QTY_TOT,MAX(EXEC_USERCD) AS EXEC_USERCD,
MAX((CASE WHEN EXEC_DATE > date_format('2000-01-01','yyyy-MM-dd') THEN EXEC_DATE ELSE NULL END)) AS EXEC_DATE
FROM ods_project_model_20230407.MET_IPM_EXECDRUG
WHERE EXEC_FLAG = '1' -- 0待执行/1已
AND VALID_FLAG = '1' -- 1有效/0作废
GROUP BY INPATIENT_NO,MO_ORDER)D ON A.INPATIENT_NO = D.INPATIENT_NO AND A.MO_ORDER = D.MO_ORDER
LEFT JOIN ods_project_model_20230407.PHA_COM_COMPANY E ON E.FAC_CODE = C.COMPANY_CODE
LEFT JOIN ods_project_model_20230407.COM_DICTIONARY F ON F.TYPE = 'DOSEUNIT' AND F.NAME = A.DOSE_UNIT
LEFT JOIN ods_project_model_20230407.COM_DICTIONARY G ON G.TYPE = 'DOSAGEFORM' AND A.DOSE_MODEL_CODE = G.CODE
LEFT JOIN ods_project_model_20230407.COM_DEPARTMENT H ON H.DEPT_CODE = A.LIST_DPCD
LEFT JOIN ods_project_model_20230407.COM_DEPARTMENT I ON I.DEPT_CODE = A.NURSE_CELL_CODE
LEFT JOIN ods_project_model_20230407.COM_EMPLOYEE J ON J.EMPL_CODE = A.DC_CONFIRM_OPER
LEFT JOIN ods_project_model_20230407.COM_EMPLOYEE K ON K.EMPL_CODE = D.EXEC_USERCD
LEFT JOIN ods_project_model_20230407.COM_EMPLOYEE L ON L.EMPL_CODE = A.CONFIRM_USERCD
WHERE A.ITEM_TYPE = '1'
AND B.OUT_DATE >= date_format('2015-01-01','yyyy-MM-dd')
and B.OUT_DATE < date_format('2016-01-01','yyyy-MM-dd')