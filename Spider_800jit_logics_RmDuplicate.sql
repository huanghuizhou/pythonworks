DELETE FROM wuliudetail
WHERE (businessno, uptime) NOT IN (
  SELECT
    businessno,
    uptime
  FROM
    (
      SELECT
        b.businessno,
        max(b.uptime) AS uptime
      FROM wuliudetail b
      GROUP BY b.businessno
    ) b
);
commit;
DELETE FROM feiyongshouru
WHERE (businessno, feeitem, uptime) NOT IN (
  SELECT
    businessno,
    feeitem,
    uptime
  FROM
    (
      SELECT
        b.businessno,
        b.feeitem,
        max(b.uptime) AS uptime
      FROM feiyongshouru b
      GROUP BY b.businessno, b.feeitem
    ) b
);
commit;
DELETE FROM luyunfeixiang
WHERE (businessno, uptime) NOT IN (
  SELECT
    b.businessno,
    uptime
  FROM
    (
      SELECT
        b.businessno,
        max(b.uptime) AS uptime
      FROM luyunfeixiang b
      GROUP BY b.businessno
    ) b
);
commit;
DELETE FROM luyunfeixiangdetail
WHERE (businessno, containersno_ctn, uptime) NOT IN (
  SELECT
    businessno,
    containersno_ctn,
    uptime
  FROM
    (
      SELECT
        b.businessno,
        b.containersno_ctn,
        max(b.uptime) AS uptime
      FROM luyunfeixiangdetail b
      GROUP BY b.businessno, b.containersno_ctn
    ) b
);
commit;
DELETE
FROM
  feiyongshouru
WHERE
  (businessno, date(UPtime)) NOT IN (
    SELECT
      b.businessno,
      date(max(b.UPtime))
    FROM
      (select
         businessno,
         UPtime
       from feiyongshouru) b
    GROUP BY
      b.businessno
  );
commit;							
