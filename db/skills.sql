SELECT DISTINCT
    it.typeID AS skillID,
    it.typeName AS skillName,
    it.description AS description,
    ig.groupName AS skillCategory,
    dta.valueFloat AS `rank`,
    dtal.valueFloat AS skillLevel,
    ip.typeID AS prereqSkillID,
    ip.typeName AS prereqSkillName,
    dtal.valueInt AS prereqSkillLevelInt,
    dtal.valueFloat AS prereqSkillLevelFloat,

    CASE
        WHEN dtal.valueFloat = 1 THEN 250
        WHEN dtal.valueFloat = 2 THEN 1414
        WHEN dtal.valueFloat = 3 THEN 8000
        WHEN dtal.valueFloat = 4 THEN 45255
        WHEN dtal.valueFloat = 5 THEN 256000
        ELSE NULL
    END AS skillPointsRequired

FROM invTypes it
JOIN Eve_SDE.invGroups ig 
    ON it.groupID = ig.groupID
JOIN Eve_SDE.dgmTypeAttributes dta 
    ON it.typeID = dta.typeID 
    AND dta.attributeID = 275 -- Skill rank
LEFT JOIN Eve_SDE.dgmTypeAttributes dta_req 
    ON dta_req.typeID = it.typeID 
    AND dta_req.attributeID IN (182, 183, 184, 1285, 1289, 1290) -- Skill prereq attributes
LEFT JOIN Eve_SDE.dgmTypeAttributes dtal 
    ON dtal.typeID = dta_req.typeID 
    AND (
        (dtal.attributeID = 277 AND dta_req.attributeID = 182) OR
        (dtal.attributeID = 278 AND dta_req.attributeID = 183) OR
        (dtal.attributeID = 279 AND dta_req.attributeID = 184) OR
        (dtal.attributeID = 1286 AND dta_req.attributeID = 1285) OR
        (dtal.attributeID = 1287 AND dta_req.attributeID = 1289) OR
        (dtal.attributeID = 1288 AND dta_req.attributeID = 1290)
    )
LEFT JOIN Eve_SDE.invTypes ip 
    ON ip.typeID = dta_req.valueInt OR ip.typeID = dta_req.valueFloat

WHERE ig.categoryID = 16 -- Skills only
    AND dta.valueFloat IS NOT NULL
    AND it.marketGroupID IS NOT NULL
    AND it.typeID NOT IN (19430, 9955)
    AND it.published = 1
    AND ig.groupName = 'Shields'

ORDER BY ig.groupName, it.typeName, ip.typeName;
