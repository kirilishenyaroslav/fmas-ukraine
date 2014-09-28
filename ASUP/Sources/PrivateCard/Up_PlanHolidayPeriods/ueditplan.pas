unit UEditPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uFControl, uLabeledFControl, uSpravControl,
  uMemoControl, uCharControl, uFloatControl, cxGrid;

type
  TfrmEditPlan = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Label1: TLabel;
    HolidayType: TqFSpravControl;
    Label2: TLabel;
    qFSpravControl1: TqFSpravControl;
    DAYS_COUNT: TqFFloatControl;
    USED_DAYS_COUNT: TqFFloatControl;
    Note: TqFMemoControl;
    cxGridViewRepository1: TcxGridViewRepository;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure HolidayTypeOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FormCreate(Sender: TObject);
    procedure qFSpravControl1OpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
  private
    { Private declarations }
  public
    id_holiday_period:int64;
    id_work_dog :int64;
    period_beg:TdateTime;
    period_end:TdateTime;
    { Public declarations }
  end;


implementation

uses RxmemDS, uUnivSprav, Up_HolidayFrame, qFTools;

{$R *.dfm}

procedure TfrmEditPlan.OkButtonClick(Sender: TObject);
begin
     qFAutoSaveIntoRegistry(Self, nil);
     
     ModalResult:=mrYes;
end;

procedure TfrmEditPlan.CancelButtonClick(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmEditPlan.HolidayTypeOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
      Params:TUnivParams;
      OutPut : TRxMemoryData;
begin
      Params.FormCaption:='Довідник типів відпусток';
      Params.ShowMode:=fsmSelect;
      Params.ShowButtons:=[fbExit];
      Params.TableName:='HL_SP_TYPE_PHOLIDAY_SEL';
      Params.Fields:='FULL_NAME,ID_TYPE_HOLIDAY';
      Params.FieldsName:='Назва';
      Params.KeyField:='ID_TYPE_HOLIDAY';
      Params.ReturnFields:='FULL_NAME,ID_TYPE_HOLIDAY';
      Params.DBHandle:=Integer(TfrPCardHolidaysPage(Owner).DB.Handle);

      OutPut:=TRxMemoryData.Create(self);

      if GetUnivSprav(Params,OutPut)
      then begin
                 value:=output['ID_TYPE_HOLIDAY'];
                 DisplayText:=VarToStr(output['FULL_NAME']);
      end;
end;

procedure TfrmEditPlan.FormCreate(Sender: TObject);
begin
     qFAutoLoadFromRegistry(Self, nil);
end;

procedure TfrmEditPlan.qFSpravControl1OpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
      Params:TUnivParams;
      OutPut : TRxMemoryData;
begin
      Screen.Cursor:=crHourGlass;
      Params.FormCaption:='За який період надається планова відпустка?';
      Params.ShowMode:=fsmSelect;
      Params.ShowButtons:=[fbExit];
      Params.TableName:='HL_DT_PHOLIDAY_SEL_BY_PCARD('+IntToStr(TfrPCardHolidaysPage(Owner).id_pcard)+')';
      Params.Fields:='PERIOD_STR,WORK_POST_STR,ID_HOLIDAY_PERIOD,ID_WORK_DOG_MOVING,PERIOD_BEG,PERIOD_END';
      Params.FieldsName:='Період,~*Посада';
      Params.KeyField:='ID_HOLIDAY_PERIOD';
      Params.ReturnFields:='WORK_POST_STR,PERIOD_STR,ID_HOLIDAY_PERIOD,ID_WORK_DOG_MOVING,PERIOD_BEG,PERIOD_END';
      Params.DBHandle:=Integer(TfrPCardHolidaysPage(Owner).DB.Handle);

      OutPut:=TRxMemoryData.Create(self);

      Screen.Cursor:=crDefault;
      if GetUnivSprav(Params,OutPut)
      then begin
                 id_holiday_period:=VarAsType(output['ID_HOLIDAY_PERIOD'],varInt64);
                 id_work_dog      :=VarAsType(output['ID_WORK_DOG_MOVING'],varInt64);
                 period_beg       :=VarAsType(output['PERIOD_BEG'],varDate);
                 period_end       :=VarAsType(output['PERIOD_END'],varDate);                 
                 DisplayText:=VarToStr(output['WORK_POST_STR'])+': '+VarToStr(output['PERIOD_STR']);
      end;
end;

end.
