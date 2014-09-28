unit Gar_Peoplel_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, gar_People_DM, cxLookAndFeelPainters, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, DB, FIBDataSet, pFIBDataSet, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, gar_Types, zTypes,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ActnList, gr_uMessage, gr_uCommonConsts,
  gr_uCommonProc, cxGroupBox, cxButtonEdit, cxLabel, gr_uCommonLoader, ZProc;
type
  TFEditPeople = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    Actions: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    ActionAdd: TAction;
    ActionDel: TAction;
    ActionClean: TAction;
    ActionList1: TActionList;
    Action1: TAction;
    GroupBoxProp: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    cxTextEdit1: TcxTextEdit;
    EditMan: TcxButtonEdit;
    EditManFio: TcxLabel;
    Action2: TAction;
    Action3: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditManPropertiesEditValueChanged(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    PLanguageIndex:integer;
    ParamLoc:TgarParamPeople;
  public
    constructor Create(Param:TgarParamPeople);reintroduce;
    function Delete(Param:TgarParamPeople):variant;
    function PrepareData(Param:TgarParamPeople):variant;
  end;

function View_FEdit(Param:TgarParamPeople):variant;

var
  FEditPeople: TFEditPeople;

implementation

{$R *.dfm}
constructor TFEditPeople.Create(Param:TgarParamPeople);
begin
  inherited Create(Param.owner);
  PLanguageIndex:=IndexLanguage;
  ParamLoc:=Param;
  ParamLoc.ID_MO:=1;//temp
end;

function TFEditPeople.Delete(Param:TgarParamPeople):variant;
begin
  DM.pFIBStoredProc1.StoredProcName:='GAR_SP_PEOPLE_D';
  DM.pFIBStoredProc1.Transaction.StartTransaction;
  DM.pFIBStoredProc1.Prepare;
  DM.pFIBStoredProc1.ParamByName('ID_GAR_PEOPLE').AsInteger:= Param.ID_GAR_PEOPLE;
  DM.pFIBStoredProc1.ExecProc;
  DM.pFIBStoredProc1.Transaction.Commit;
end;

function View_FEdit(Param:TgarParamPeople):variant;
begin
  FEditPeople:=TFEditPeople.Create(Param);
  if Param.fs=garfsDelete then FEditPeople.delete(Param)
  else  FEditPeople.PrepareData(Param);
  if Param.fs<>garfsDelete then
  FEditPeople.ShowModal;
  FEditPeople.Free;
  Result:=Param.ParamEditBtn.id;
end;

function TFEditPeople.PrepareData(Param:TgarParamPeople):variant;
begin

  case Param.fs of
    garfsInsert:
      try

      except

      end;
    garfsUpdate:
      try
        EditMan.Text:=VarToStr(Param.ParamEditBtn.Tn);
        EditManFio.EditValue:=VarToStr(Param.ParamEditBtn.Caption);
        cxTextEdit1.EditValue:=VarToStr(Param.Dolgnost);
      except
      
      end;
  end;

end;

procedure TFEditPeople.Action1Execute(Sender: TObject);
begin

  if EditManFio.Caption='' then
    begin
      showmessage('Поле человека не заполнено!');
      exit;
    end;

  if (cxTextEdit1.EditValue='') or (cxTextEdit1.EditValue=null) then
    begin
      showmessage('Поле должности не заполнено!');
      exit;
    end;

  with DM do
  try
    pFIBStoredProc1.Transaction.StartTransaction;
    case ParamLoc.fs of
      garfsInsert: pFIBStoredProc1.StoredProcName:='GAR_SP_PEOPLE_I';
      garfsUpdate: pFIBStoredProc1.StoredProcName:='GAR_SP_PEOPLE_U';
    end;
    pFIBStoredProc1.Prepare;
    pFIBStoredProc1.ParamByName('ID_MAN').AsInt64         := ParamLoc.ParamEditBtn.id;
    pFIBStoredProc1.ParamByName('ID_MO').AsInt64          := ParamLoc.ID_MO;
    pFIBStoredProc1.ParamByName('POST').AsVariant         := cxTextEdit1.EditValue;

    case ParamLoc.fs of
     garfsUpdate:
       pFIBStoredProc1.ParamByName('ID_GAR_PEOPLE').AsInt64 := ParamLoc.ID_GAR_PEOPLE;
    end;

    pFIBStoredProc1.ExecProc;
    if ParamLoc.fs=garfsInsert then ParamLoc.ID_GAR_PEOPLE:=pFIBStoredProc1.ParamByName('ID_GAR_PEOPLE').AsInt64;
    pFIBStoredProc1.Transaction.Commit;
  except
    on e:Exception do
      begin
        grShowMessage(ECaption[PLanguageIndex],e.message,mtError,[mbOk]);
        pFIBStoredProc1.Transaction.RollBack;
      end;
  end;

  ModalResult:=mrYes;
end;

procedure TFEditPeople.EditManPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Man:variant;
begin
Man:=ShowSpPeople(Self,ParamLoc.DB_Handle);
  if VarArrayDimCount(Man)>0 then
   begin
     if man[0]<>NULL then
      begin
        ParamLoc.ParamEditBtn.id:=man[0];
        ParamLoc.ParamEditBtn.Tn:=grifThen(VarIsNull(Man[4]),0,Man[4]);
        ParamLoc.ParamEditBtn.Caption:=VarToStr(Man[1]+' '+man[2]+' '+Man[3]);
        EditManFio.Caption := ParamLoc.ParamEditBtn.Caption;
        EditMan.Text := IntToStr(ParamLoc.ParamEditBtn.Tn);
      end;
   end
end;

procedure TFEditPeople.EditManPropertiesEditValueChanged(Sender: TObject);
var man:Variant;
begin
if EditMan.Text<>'' then
 begin
  if StrToInt(EditMan.Text)=ParamLoc.ParamEditBtn.Tn then Exit;
  man:=ManByTn(StrToInt(EditMan.Text),ParamLoc.DB_Handle);
  if VarArrayDimCount(man)>0 then
   begin
    ParamLoc.ParamEditBtn.Id:=man[0];
    ParamLoc.ParamEditBtn.Tn:=grifThen(VarIsNull(Man[1]),0,Man[1]);
    ParamLoc.ParamEditBtn.Caption:=man[2];
    EditManFio.Caption := ParamLoc.ParamEditBtn.Caption;
   end
  else
   EditMan.SetFocus;
 end;
end;

procedure TFEditPeople.Action2Execute(Sender: TObject);
begin
      if  cxButton1.Focused Then Action1Execute(Sender);
      if  cxButton2.Focused Then cxButton2Click(Sender);
      SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

procedure TFEditPeople.cxButton2Click(Sender: TObject);
begin
  Modalresult:=mrCancel;  
end;

end.


