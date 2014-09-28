unit FilterFormWorkHourse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxButtons,
  ActnList, ZTypes;

type
  TFFilterFormWorkHourse = class(TForm)
    ActionList: TActionList;
    actYes: TAction;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    DateBeg: TcxDateEdit;
    DateEnd: TcxDateEdit;
    LabelTo: TcxLabel;
    cxLabel1: TcxLabel;
    procedure YesBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure actYesExecute(Sender: TObject);
  private
    ParamLoc: TZSimpleParamDate;
  public
    constructor Create(Param :TZSimpleParamDate); reintroduce;
  end;



implementation

{$R *.dfm}
//Param:TZDateParam
{ TFFilterFormWorkHourse }

constructor TFFilterFormWorkHourse.Create(Param: TZSimpleParamDate);
begin
  inherited Create(Param.Owner);
  ParamLoc:= Param;
  DateBeg.Properties.MaxDate := strToDate('01.01.2050');
  DateBeg.Properties.MinDate := strToDate('01.01.1990');
  DateEnd.Properties.MaxDate := strToDate('01.01.2050');
  DateEnd.Properties.MinDate := strToDate('01.01.1990');

  DateBeg.Date   := StrToDate('01.'+FormatDateTime('mm.yyyy',Date));
  DateEnd.Date   := IncMonth(strToDate('01.'+FormatDateTime('mm.yyyy',Date))-1,1);
//
end;

procedure TFFilterFormWorkHourse.YesBtnClick(Sender: TObject);
begin
  ParamLoc.Datebeg:= DateBeg.Date;
  ParamLoc.DateEnd:= DateEnd.Date;
  ModalResult:=mrYes;
end;

procedure TFFilterFormWorkHourse.CancelBtnClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFFilterFormWorkHourse.actYesExecute(Sender: TObject);
begin
   YesBtnClick(Sender);
end;

end.
