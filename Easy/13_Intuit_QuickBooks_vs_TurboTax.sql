-- Intuit QuickBooks vs TurboTax --

SELECT 
  COUNT(*) FILTER(WHERE product LIKE 'TurboTax%') AS turbotax_total,
  COUNT(*) FILTER(WHERE product LIKE 'QuickBooks%') AS quickbooks_total
FROM filed_taxes;
