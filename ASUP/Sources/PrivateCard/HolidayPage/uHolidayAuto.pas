unit uHolidayAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, FIBDataSet, pFIBDataSet, StdCtrls, Buttons, uCharControl,
  uIntControl, uDateControl, uFControl, uLabeledFControl, uSpravControl,
  ExtCtrls, uFormControl;

type
  TAutoHoliday = class(TFrame)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    FormControl: TqFFormControl;
    RadioGroup1: TRadioGroup;
    qFSpravControl3: TqFSpravControl;
    qFSpravControl4: TqFSpravControl;
    Period_Beg: TqFDateControl;
    Period_end: TqFDateControl;
    Holiday: TqFSpravControl;
    DateBeg: TqFDateControl;
    DateEnd: TqFDateControl;
    HTerm: TqFIntControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Department: TqFSpravControl;
    ShtatrasQuery: TpFIBDataSet;
    ShtatrasQueryID_SR: TFIBIntegerField;
    ShtatrasQueryKOD_SM: TFIBIntegerField;
    ShtatrasQuerySM_NUMBER: TFIBIntegerField;
    ShtatrasQuerySM_TITLE: TFIBStringField;
    ShtatrasQueryKOL_STAVOK: TFIBFloatField;
    ShtatrasQueryKOL_VACANT_STAVOK: TFIBFloatField;
    ShtatrasQueryOKLAD: TFIBFloatField;
    ShtatrasQuerySM_NUMBER_PPS: TFIBIntegerField;
    ShtatrasQueryKOD_SM_PPS: TFIBIntegerField;
    ShtatrasQuerySM_TITLE_PPS: TFIBStringField;
    ShtatrasQueryKOEFF_PPS: TFIBFloatField;
    ShtatrasQueryWITHKOEF: TFIBStringField;
    ShtatrasQuerySR_NAME: TFIBStringField;
    ShtatrasQueryID_WORK_COND: TFIBIntegerField;
    ShtatrasQueryNAME_WORK_COND: TFIBStringField;
    ShtatrasQueryID_WORK_MODE: TFIBIntegerField;
    ShtatrasQueryNAME_WORK_MODE: TFIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
