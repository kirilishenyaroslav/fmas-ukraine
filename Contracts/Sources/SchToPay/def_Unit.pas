//******************************************************************************
// Проект "Контракты"
// Справочник категорий обучения
// Чернявский А.Э. 2005г.
//******************************************************************************

unit National_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  cn_DM_Sch, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts;

type
  TfrmSchToPay = class(TForm)
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_Sch;
    procedure FormIniLanguage;
  public
    res:Variant;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmSchToPay.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DM:=TDM_Sch.Create(Self);
DM.DB.Handle:=DB_Handle;
FormIniLanguage();
Screen.Cursor:=crDefault;
end;

procedure TfrmSchToPay.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();
end;

procedure TfrmSchToPay.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmSchToPay.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then action:=caFree
else
DM.Free;
end;

procedure TfrmSchToPay.SelectButtonClick(Sender: TObject);
var id_sp: int64;
begin
Res:=VarArrayCreate([0,3],varVariant);
id_sp:= DM.DataSet['ID_NATIONAL'];
Res[0]:= id_sp;
Res[1]:=DM.DataSet['NAME'];
Res[2]:=DM.DataSet['SHORT_NAME'];
ModalResult:=mrOk;
end;

procedure TfrmSchToPay.FormShow(Sender: TObject);
begin
if FormStyle = fsMDIChild then  SelectButton.Enabled:=false;
end;

end.
