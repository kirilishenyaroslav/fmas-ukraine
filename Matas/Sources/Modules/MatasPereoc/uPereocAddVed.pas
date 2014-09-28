{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с переоценкой ТМЦ                       }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uPereocAddVed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, uMatasVars, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxRadioGroup, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxButtonEdit, uSpMatSchMulti, ibase,
  cxCurrencyEdit, GlobalSPR, cxCheckBox;

type
  TVedPereocAddForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Label1: TLabel;
    cxNumVed: TcxTextEdit;
    lbl1: TLabel;
    cxDateVed: TcxDateEdit;
    cxCheckOst: TcxRadioGroup;
    LabelSch: TLabel;
    cxLookupSch: TcxButtonEdit;
    Label2: TLabel;
    cxCoeff: TcxCurrencyEdit;
    Label3: TLabel;
    cxNameCorrSch: TcxButtonEdit;
    cxCheckSch: TcxCheckBox;
    Label4: TLabel;
    cxDateOpr: TcxDateEdit;
    cxCheckDate: TcxCheckBox;
    cxCheckGrpDoc: TcxCheckBox;
    cxCheckRound: TcxCheckBox;
    Label5: TLabel;
    cxNameIznSch: TcxButtonEdit;
    cxCheckIzn: TcxCheckBox;
    cxCheckRoundIzn: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cxLookupSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxLookupSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxNameCorrSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OkButtonClick(Sender: TObject);
    procedure cxNameCorrSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckDatePropertiesChange(Sender: TObject);
    procedure cxNameIznSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxNameIznSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
   DBHANDLE : TISC_DB_HANDLE;
   FILTER_ID_SESSION: integer;
   F_SCH: Boolean;
   CORR_ID_SCH: Integer;
   IZN_ID_SCH: Integer;
  end;

var
  VedPereocAddForm: TVedPereocAddForm;

implementation

uses DateUtils;

{$R *.dfm}

procedure TVedPereocAddForm.FormCreate(Sender: TObject);
begin
 Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_ACC_RECOST+'::Нова відомість';
 OkButton.Caption:=MAT_BUTTON_OK_CONST;
 CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
 cxNumVed.Text:='0';
 cxDateVed.EditValue:=EndOfTheMonth(_MATAS_PERIOD);
 cxDateOpr.EditValue:=StartOfTheMonth(_MATAS_PERIOD);
 F_SCH:=False;
end;

procedure TVedPereocAddForm.cxLookupSchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 mr:=false;
 Res:=uSpMatSchMulti.GetMatSchMulti(self, DBHandle, 0, FILTER_ID_SESSION, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxLookupSch.Text := s;
   F_SCH:=true;
  end
 end
 else
 begin
  F_SCH:=false;
  cxLookupSch.Text:='';
 end;
end;

procedure TVedPereocAddForm.cxLookupSchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxLookupSch.Text:='';
  FILTER_ID_SESSION:=0;
  F_SCH:=false;
 end
end;

procedure TVedPereocAddForm.cxNameCorrSchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxNameCorrSch.Text:='';
  CORR_ID_SCH:=0;
 end
end;

procedure TVedPereocAddForm.OkButtonClick(Sender: TObject);
begin
 if cxCoeff.Value=1 then
 begin
  ShowMessage('Коефіцієнт не може дорівнювати 1!');
  Exit;
 end;
 if not F_SCH then
 begin
  ShowMessage('Необхідно вказати рахунки!');
  Exit;
 end;
 if CORR_ID_SCH=0 then
 begin
  ShowMessage('Необхідно вказати кореспондуючий рахунок!');
   Exit;
 end;
 if cxCheckIzn.Checked and (IZN_ID_SCH=0) then
 begin
  ShowMessage('Необхідно вказати кореспондуючий рахунок для зносу!');
   Exit;
 end;
 ModalResult:=mrOk;
end;

procedure TVedPereocAddForm.cxNameCorrSchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=GlobalSPR.GetSch(self,DBHandle, fsNormal, Date, _ID_SCH_ROOT, -1, CORR_ID_SCH);
 if VarArrayDimCount(Res)>0 then
 begin
   CORR_ID_SCH := Res[0][0];
   cxNameCorrSch.Text := VarToStr(RES[0][3]);
  end;
end;

procedure TVedPereocAddForm.cxCheckDatePropertiesChange(Sender: TObject);
begin
 Label4.Enabled:=cxCheckDate.Checked;
 cxDateOpr.Enabled:=cxCheckDate.Checked;
end;

procedure TVedPereocAddForm.cxNameIznSchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxNameIznSch.Text:='';
  IZN_ID_SCH:=0;
 end
end;

procedure TVedPereocAddForm.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  cxNameIznSch.Enabled:=cxCheckIzn.Checked;
  cxCheckRoundIzn.Enabled:=cxCheckIzn.Checked;
end;

procedure TVedPereocAddForm.cxNameIznSchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Res : Variant;
begin
 Res:=GlobalSPR.GetSch(self,DBHandle, fsNormal, Date, _ID_SCH_ROOT, -1, IZN_ID_SCH);
 if VarArrayDimCount(Res)>0 then
 begin
   IZN_ID_SCH := Res[0][0];
   cxNameIznSch.Text := VarToStr(RES[0][3]);
  end;
end;

end.
