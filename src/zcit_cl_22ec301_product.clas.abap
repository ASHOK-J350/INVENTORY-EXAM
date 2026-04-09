CLASS zcit_cl_22ec301_product DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    " Attributes with read-only visibility for consumers [cite: 62]
    DATA: product_id TYPE zcit_prd_22ec301-product_id READ-ONLY,
          category   TYPE zcit_prd_22ec301-category READ-ONLY,
          price      TYPE zcit_prd_22ec301-price READ-ONLY.

    METHODS constructor
      IMPORTING
        i_product_id TYPE zcit_prd_22ec301-product_id
        i_category   TYPE zcit_prd_22ec301-category
        i_price      TYPE zcit_prd_22ec301-price
      RAISING
        zcit_cx_22ec301_no_prod.

  PROTECTED SECTION.
    " Subclass can access directly, but consumer cannot [cite: 62]
    DATA: supplier_id TYPE zcit_prd_22ec301-supplier_id.

  PRIVATE SECTION.
ENDCLASS.

CLASS zcit_cl_22ec301_product IMPLEMENTATION.
METHOD constructor.
    " 1. Set the values of product_id, category, and price [cite: 68]
    me->product_id = i_product_id.
    me->category   = i_category.
    me->price      = i_price.

    " 2. Read corresponding entry from database table to fill supplier_id [cite: 69]
    SELECT SINGLE supplier_id
      FROM zcit_prd_22ec301
      WHERE product_id = @i_product_id
      INTO @me->supplier_id.

    " 3. If the entry does not exist, raise the exception [cite: 70]
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcit_cx_22ec301_no_prod.
    ENDIF.
    ENDMETHOD.

ENDCLASS.
