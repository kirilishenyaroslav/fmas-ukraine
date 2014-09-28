unit Gar_MarkaTopl_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, DB, FIBDataSet, pFIBDataSet, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, gar_Types, zTypes,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ActnList, gr_uMessage, gr_uCommonConsts,
  gr_uCommonProc, cxGroupBox, gar_MarkaTopl_DM;
type
  TFEditMarkaTopl = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Actions: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    ActionAdd: TAction;
    ActionDel: TAction;
    ActionClean: TAction;
    ActionList1: TActionList;
    Action1: TAction;
    GroupBoxProp: TcxGroupBox;
    cxMaskEdit1: TcxMaskEdit;
    Action2: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    PLanguageIndex:integer;
    ParamLoc:TgarParamMarkaTopl;
  public
    constructor Create(Param:TgarParamMarkaTopl);reintroduce;
    function Delete(Param:TgarParamMarkaTopl):variant;
    function PrepareData(Param:TgarParamMarkaTopl):variant;
  end;

function View_FEdit(Param:TgarParamMarkaTopl):variant;

var
  FEditMarkaTopl: TFEditMarkaTopl;

implementation

{$R *.dfm}
constructor TFEditMarkaTopl.Create(Param:TgarParamMarkaTopl);
begin
  inherited Create(Param.owner);
  PLanguageIndex:=IndexLanguage;
  ParamLoc:=Param;
end;

function TFEditMarkaTopl.Delete(Param:TgarParamMarkaTopl):variant;
begin
  DM.pFIBStoredProc1.StoredProcName:='GAR_SP_MARKA_TOPL_D';
  DM.pFIBStoredProc1.Transaction.StartTransaction;
  DM.pFIBStoredProc1.Prepare;
  DM.pFIBStoredProc1.ParamByName('ID_MARKA_TOPL').AsInteger:= Param.ID_MARKA_TOPL;
  DM.pFIBStoredProc1.ExecProc;
  DM.pFIBStoredProc1.Transaction.Commit;
end;

function View_FEdit(Param:TgarParamMarkaTopl):variant;
begin
  FEditMarkaTopl:=TFEditMarkaTopl.Create(Param);
  if Param.fs=garfsDelete then FEditMarkaTopl.delete(Param)
  else  FEditMarkaTopl.PrepareData(Param);
  if Param.fs<>garfsDelete then
  FEditMarkaTopl.ShowModal;
  FEditMarkaTopl.Free;
  Result:=Param.ID_MARKA_TOPL;
end;

function TFEditMarkaTopl.PrepareData(Param:TgarParamMarkaTopl):variant;
begin
  case Param.fs of
    //zcfsInsert:
        //cxTextEdit1.EditValue:=Param.MARKA_TOPL;

    garfsUpdate:
      begin
        cxMaskEdit1.EditValue:=Param.MARKA_TOPL;
      end;
   end;
end;

procedure TFEditMarkaTopl.Action1Execute(Sender: TObject);
begin

  if (cxMaskEdit1.Text='')  then
    begin
      showmessage('Поле марки не заполнено!');
      exit;
    end;

  with DM do
  try
    pFIBStoredProc1.Transaction.StartTransaction;
    case ParamLoc.fs of
      garfsInsert: pFIBStoredProc1.StoredProcName:='GAR_SP_MARKA_TOPL_I';
      garfsUpdate: pFIBStoredProc1.StoredProcName:='GAR_SP_MARKA_TOPL_U';
    end;
    pFIBStoredProc1.Prepare;
    pFIBStoredProc1.ParamByName('MARKA_TOPL').AsVariant  := cxMaskEdit1.EditValue;

    case ParamLoc.fs of
     garfsUpdate:
       pFIBStoredProc1.ParamByName('ID_MARKA_TOPL').AsInt64   := ParamLoc.ID_MARKA_TOPL;
    end;

    pFIBStoredProc1.ExecProc;
    if ParamLoc.fs=garfsInsert then ParamLoc.ID_MARKA_TOPL:=pFIBStoredProc1.ParamByName('ID_MARKA_TOPL').AsInt64;
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

procedure TFEditMarkaTopl.Action2Execute(Sender: TObject);
begin
      if  cxButton1.Focused Then Action1Execute(Sender);
      if  cxButton2.Focused Then cxButton2Click(Sender);
      SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

procedure TFEditMarkaTopl.cxButton2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
