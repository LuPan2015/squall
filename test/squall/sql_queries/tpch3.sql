# TPCH3:ver1.0

SELECT LINEITEM.ORDERKEY, SUM(LINEITEM.EXTENDEDPRICE*(1.0-LINEITEM.DISCOUNT)), ORDERS.ORDERDATE, ORDERS.SHIPPRIORITY
FROM CUSTOMER inner join ORDERS on CUSTOMER.CUSTKEY = ORDERS.CUSTKEY
inner join LINEITEM on LINEITEM.ORDERKEY = ORDERS.ORDERKEY
WHERE CUSTOMER.MKTSEGMENT = 'BUILDING' and
ORDERS.ORDERDATE < {d '1995-03-15'} and LINEITEM.SHIPDATE > {d '1995-03-15'}
GROUP BY LINEITEM.ORDERKEY, ORDERS.ORDERDATE, ORDERS.SHIPPRIORITY
