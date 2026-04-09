CLASS zcit_cl_22ec301_perishable DEFINITION
  PUBLIC
  INHERITING FROM zcit_cl_22ec301_product
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        i_product_id TYPE zcit_prd_22ec301-product_id
        i_category   TYPE zcit_prd_22ec301-category
        i_price      TYPE zcit_prd_22ec301-price
      RAISING
        zcit_cx_22ec301_no_prod.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA expiry_date TYPE d.
ENDCLASS.

CLASS zcit_cl_22ec301_perishable IMPLEMENTATION.

  METHOD constructor.
    " 1. Call superclass constructor to set base attributes
    SUPER->constructor(
      EXPORTING
        i_product_id = i_product_id
        i_category   = i_category
        i_price      = i_price
    ).

    DATA lv_shelf_life TYPE i.

    " 2. Read ShelfLife from your custom table ZCIT_PRD_22EC301
    SELECT SINGLE shelflife
      FROM zcit_prd_22ec301
      WHERE product_id = @i_product_id
      INTO @lv_shelf_life.

    " 3. Raise exception if the product is not found in the table
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcit_cx_22ec301_no_prod.
    ELSE.
      " 4. Calculate expiry date using system date + shelf life
      DATA(lv_today) = cl_abap_context_info=>get_system_date( ).
      me->expiry_date = lv_today + lv_shelf_life.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
