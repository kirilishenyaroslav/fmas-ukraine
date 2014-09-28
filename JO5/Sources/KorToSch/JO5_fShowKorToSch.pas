unit JO5_fShowKorToSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, StdCtrls, cxButtons,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, cxInplaceContainer,
  cxDBTL, cxControls, cxTLData, IBase, DB, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, Jo5_Types, Jo5_Proc, cxCurrencyEdit, Jo5_dmCommonStyles,
  Jo5_PackageLoad, Jo5_Consts, ActnList, frxClass, frxDBSet, frxDesgn,
  cxTextEdit;

type
  TfKorToSch = class(TForm)
    KorTypeRG: TRadioGroup;
    DetailsBtn: TcxButton;
    ActionPnl: TPanel;
    ExitBtn: TcxButton;
    DB: TpFIBDatabase;
    DSet1: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    DSource1: TDataSource;
    ActionList1: TActionList;
    DetailsAction: TAction;
    ExitAction: TAction;
    PrintAction: TAction;
    KorTreeList: TcxDBTreeList;
    cmnOUT_ID_SCH: TcxDBTreeListColumn;
    cmnOUT_ID_PARENT_SCH: TcxDBTreeListColumn;
    cmnOUT_SCH_NUMBER: TcxDBTreeListColumn;
    cmnOUT_SCH_TITLE: TcxDBTreeListColumn;
    cmnOUT_SUMMA: TcxDBTreeListColumn;
    ShowTypeRG: TRadioGroup;
    cmnOUT_ID_DOC: TcxDBTreeListColumn;
    cmnOUT_DOC_NUMBER: TcxDBTreeListColumn;
    cmnOUT_DOC_NOTE: TcxDBTreeListColumn;
    cmnOUT_DOC_DATE: TcxDBTreeListColumn;
    procedure KorTypeRGClick(Sender: TObject);
    procedure DetailsActionExecute(Sender: TObject);
    procedure ExitActionExecute(Sender: TObject);
    procedure ShowTypeRGClick(Sender: TObject);
  private
    { Private declarations }
    pParam:TJo5SchKor;
    pLanguageIndex:byte;
    pStylesDM:TStylesDM;
    pSysInfo:TJo5SysInfo;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE;AParam:TJo5SchKor; SysInfo:TJo5SysInfo); reintroduce;
    procedure DSetReOpen;
  end;

function View_Jo5_KorToSch(AOwner:TComponent;AHandle:TISC_DB_HANDLE;AParam:TJo5SchKor; SysInfo:TJo5SysInfo):variant; stdcall;
 exports View_Jo5_KorToSch;
implementation

{$R *.dfm}

uses zProc;

function View_Jo5_KorToSch(AOwner:TComponent;AHandle:TISC_DB_HANDLE;AParam:TJo5SchKor; SysInfo:TJo5SysInfo):variant;
var
  ViewForm:TfKorToSch;
begin
  ViewForm:=TfKorToSch.Create(AOwner,AHandle,AParam, SysInfo);
  ViewForm.ShowModal;
  ViewForm.Free;
end;

constructor TfKorToSch.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE;AParam:TJo5SchKor; SysInfo:TJo5SysInfo);
begin
  inherited Create(AOwner);
  pLanguageIndex:=IndexLanguage;
  pParam:=AParam;
  pSysInfo:=SysInfo;
//******************************************************************************
  pStylesDM:=TStylesDM.Create(self);
  KorTreeList.Styles.StyleSheet:=pStylesDM.TreeListStyleSheetDevExpress;
//******************************************************************************
  Caption:= KorToSch_Caption[pLanguageIndex]+' '+pParam.SchTitle;
  KorTypeRG.Caption  := LabelKorType_Caption[pLanguageIndex];
  KorTypeRG.Items[0] := LabelDbKorType_Caption[pLanguageIndex];
  KorTypeRG.Items[1] := LabelKrKorType_Caption[pLanguageIndex];
  KorTypeRG.Hint     := LabelSelectKorType_Caption[pLanguageIndex];
  DetailsBtn.Caption := AdditionalBtn_Caption[pLanguageIndex];
  ExitBtn.Caption    := ExitBtn_Caption[pLanguageIndex];
  DetailsAction.Hint := AdditionalBtn_Caption[pLanguageIndex];
  ExitAction.Hint    := ExitBtn_Caption[pLanguageIndex];
  PrintAction.Hint   := PrintBtn_Caption[pLanguageIndex];
  ShowTypeRG.Caption := LabelDataType_Caption[PLanguageIndex];
  ShowTypeRG.Hint    := LabelDataType_Caption[PLanguageIndex];
  ShowTypeRG.Items[0]:= LabelSCHs_Caption[PLanguageIndex];
  ShowTypeRG.Items[1]:= LabelDocs_Caption[PLanguageIndex];
//******************************************************************************
  cmnOUT_SCH_NUMBER.Caption.Text := GridClNum_Caption[PLanguageIndex];
  cmnOUT_SCH_TITLE.Caption.Text  := GridClName_Caption[PLanguageIndex];
  cmnOUT_SUMMA.Caption.Text      := GridClSumma_Caption[PLanguageIndex];
  if pParam.HasChildren then DetailsAction.Enabled:=False;
//******************************************************************************
  DB.Handle:=AHandle;
  Transaction.Active:=True;
  DSetReOpen;
//******************************************************************************
end;

procedure TfKorToSch.DSetReOpen;
begin
  if DSet1.Active then DSet1.Close;

 if ShowTypeRG.ItemIndex=0 then
  DSet1.SQLs.SelectSQL.Text:='SELECT * FROM JO5_GET_ALL_GROUP_KORRESPONDENT('
  +IntToStr(pParam.IdRegUch)+','+IntToStr(pParam.IdSch)+','''+DateToStr(pParam.SelDate)+''','
  +IfThen(pParam.HasChildren,'1','0')+','+IntToStr(KorTypeRG.ItemIndex)+','+IntToStr(pSysInfo.id_system)+')'

 else
  DSet1.SQLs.SelectSQL.Text:='SELECT * FROM JO5_GET_ALL_GROUP_DOCS('
  +IntToStr(pParam.IdRegUch)+','+IntToStr(pParam.IdSch)+','''+DateToStr(pParam.SelDate)+''','
  +IfThen(pParam.HasChildren,'1','0')+','+IntToStr(KorTypeRG.ItemIndex)+','+IntToStr(pSysInfo.id_system)+')';
  DSet1.Open;
  KorTreeList.FullCollapse;
  cmnOUT_SUMMA.SummaryFooter.SummaryValue:=pParam.Oborots[KorTypeRG.ItemIndex];
end;
procedure TfKorToSch.KorTypeRGClick(Sender: TObject);
begin
  DSetReOpen;
end;

procedure TfKorToSch.DetailsActionExecute(Sender: TObject);
begin
  LoadDopKorToSch(Application,DB.Handle,pParam);
end;

procedure TfKorToSch.ExitActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TfKorToSch.ShowTypeRGClick(Sender: TObject);
begin
 if ShowTypeRG.ItemIndex=0 then
   begin
     KorTreeList.DataController.KeyField:='OUT_ID_SCH';
     KorTreeList.DataController.ParentField:='OUT_ID_PARENT_SCH';
     cmnOUT_SCH_NUMBER.Visible    := True;
     cmnOUT_SCH_TITLE. Visible    := True;
     cmnOUT_DOC_NUMBER.Visible    := False;
     cmnOUT_DOC_NOTE.Visible      := False;
     cmnOUT_DOC_DATE.Visible      := False;

     cmnOUT_SUMMA.Position.ColIndex:=6;
   end
 else
   begin
     KorTreeList.DataController.KeyField:='OUT_ID_DOC';
     KorTreeList.DataController.ParentField:='OUT_ID_DOC';
     cmnOUT_SCH_NUMBER.Visible    := False;
     cmnOUT_SCH_TITLE. Visible    := False;
     cmnOUT_DOC_NUMBER.Visible    := True;
     cmnOUT_DOC_NOTE.Visible      := True;
     cmnOUT_DOC_DATE.Visible      := True;

     cmnOUT_SUMMA.Position.ColIndex:=6;
   end;


 DSetReOpen;
end;

end.
