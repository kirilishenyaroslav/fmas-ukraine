unit gar_FACTOR_EDIT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMaskEdit, StdCtrls, cxButtons,
  ExtCtrls, cxContainer, cxEdit, cxTextEdit, cxControls, cxGroupBox, gar_types,
  ActnList, gr_uMessage, gr_uCommonConsts,gar_GarageProc;

type
  TFFACTOR_EDIT = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGroupBox3: TcxGroupBox;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    cxMaskEdit1: TcxMaskEdit;
    cxMaskEdit2: TcxMaskEdit;
    Action3: TAction;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    ParamLoc:TgarParamFactor;
  public
    constructor Create(Param:TgarParamFactor); reintroduce;
    procedure prepData(Param:TgarParamFactor);
  end;
function View_FFACTOR_EDIT(Param:TgarParamFactor):variant;

var
  FFACTOR_EDIT: TFFACTOR_EDIT;

implementation

uses gar_FACTOR_DM;

{$R *.dfm}

function View_FFACTOR_EDIT(Param:TgarParamFactor):variant;
begin
  FFACTOR_EDIT:=TFFACTOR_EDIT.Create(Param);
  FFACTOR_EDIT.PrepData(Param);
  if  Param.fs<> garfsDelete then FFACTOR_EDIT.ShowModal;
end;

procedure TFFACTOR_EDIT.Action1Execute(Sender: TObject);
begin
if cxMaskEdit1.Text='' then
begin
  ShowMessage('Имя фактора не введено');
  exit;
end;

if cxMaskEdit2.Text='' then
begin
  ShowMessage('Величина надбавки не введена');
  exit;
end;

with DM do
  try
    pFIBStoredProc1.Transaction.StartTransaction;
    case ParamLoc.fs of
      garfsInsert: pFIBStoredProc1.StoredProcName:='GAR_SP_FACTOR_I';
      garfsUpdate: pFIBStoredProc1.StoredProcName:='GAR_SP_FACTOR_U';
    end;
    pFIBStoredProc1.Prepare;
    pFIBStoredProc1.ParamByName('NAME_FACTOR').AsVariant      := cxMaskEdit1.EditValue;
    pFIBStoredProc1.ParamByName('VALUE_FACTOR').AsVariant     := cxMaskEdit2.EditValue;

    case ParamLoc.fs of
     garfsUpdate:
       pFIBStoredProc1.ParamByName('ID_FACTOR').AsInt64   := pFIBDataSet1['id_factor'];
    end;

    pFIBStoredProc1.ExecProc;
    if ParamLoc.fs=garfsInsert then ParamLoc.ID_Factor:=pFIBStoredProc1.ParamByName('ID_Factor').AsInt64;
    pFIBStoredProc1.Transaction.Commit;
  except
    on e:Exception do
      begin
        grShowMessage(ECaption[LanguageIndex],e.message,mtError,[mbOk]);
        pFIBStoredProc1.Transaction.RollBack;
      end;
  end;

  ModalResult:=mrYes;
end;



{ TFFACTOR_EDIT }

constructor TFFACTOR_EDIT.Create(Param: TgarParamFactor);
begin
  inherited  Create(Param.owner);
  ParamLoc:=Param;
  Visible:=False;
end;

procedure TFFACTOR_EDIT.prepData(Param: TgarParamFactor);
begin
  case Param.fs of
    garfsInsert:
      begin
      end;
    garfsUpdate:
      begin
        ParamLoc.id_factor:=DM.pFIBDataSet1['id_factor'];
        cxMaskEdit1.EditValue:=DM.pFIBDataSet1['NAME'];
        cxMaskEdit2.EditValue:=DM.pFIBDataSet1['VALUE_FACTOR'];
      end;
    garfsDelete:
      begin
        with DM do
          try
            pFIBStoredProc1.Transaction.StartTransaction;
            pFIBStoredProc1.StoredProcName:='GAR_SP_FACTOR_D';
            pFIBStoredProc1.Prepare;
            pFIBStoredProc1.ParamByName('ID_FACTOR').AsInt64  := pFIBDataSet1['id_factor'];
            pFIBStoredProc1.ExecProc;
            pFIBStoredProc1.Transaction.Commit;
          except
            on e:Exception do
              begin
                grShowMessage(ECaption[LanguageIndex],e.message,mtError,[mbOk]);
                pFIBStoredProc1.Transaction.RollBack;
              end;
          end;
      end;
  end;
end;

procedure TFFACTOR_EDIT.Action2Execute(Sender: TObject);
begin
      if  cxButton1.Focused Then Action1Execute(Sender);
      if  cxButton2.Focused Then cxButton2Click(Sender);
      SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

procedure TFFACTOR_EDIT.cxButton2Click(Sender: TObject);
begin
  modalResult:=mrCancel;
end;

end.
