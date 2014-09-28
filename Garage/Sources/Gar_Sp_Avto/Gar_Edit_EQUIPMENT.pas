unit Gar_Edit_EQUIPMENT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxCalendar, cxMaskEdit,
  cxContainer, cxEdit, cxTextEdit, cxControls, cxGroupBox, StdCtrls,
  cxButtons, ExtCtrls, Gar_Types, ActnList, gar_Avto_DM, gr_uMessage, gr_uCommonConsts,
  gar_GarageProc;

type
  TFEditEQUIPMENT = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxTextEdit1: TcxTextEdit;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    cxTextEdit3: TcxTextEdit;
    cxGroupBox5: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxTextEdit5: TcxTextEdit;
    cxTextEdit12: TcxMaskEdit;
    cxDateEdit1: TcxDateEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    constructor Create(param:TgarParamEQUIPMENT); reintroduce;
    Procedure PrepareDataEditEQUIPMENT(param:TgarParamEQUIPMENT);
    procedure Action1Execute(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
  private
    ParamLoc:TgarParamEQUIPMENT;
  public
    { Public declarations }
  end;

Function View_FEditEQUIPMENT(param:TgarParamEQUIPMENT):variant;

var
  FEditEQUIPMENT: TFEditEQUIPMENT;

implementation

{$R *.dfm}

Function View_FEditEQUIPMENT(param:TgarParamEQUIPMENT):variant;
begin
  View_FEditEQUIPMENT:=False;
  FEditEQUIPMENT:=TFEditEQUIPMENT.Create(param);
  FEditEQUIPMENT.PrepareDataEditEQUIPMENT(param);
  if FEditEQUIPMENT.ShowModal=mrYes then View_FEditEQUIPMENT:=True;
end;

{ TFEditEQUIPMENT }

constructor TFEditEQUIPMENT.Create(param: TgarParamEQUIPMENT);
begin
  inherited Create(param.Owner);
  ParamLoc:=param;
end;

procedure TFEditEQUIPMENT.PrepareDataEditEQUIPMENT(
  param: TgarParamEQUIPMENT);
begin
  with DM do
  case param.fs of
    garfsInsert:
      begin
        //
      end;
    garfsUpdate:
      begin
        cxTextEdit1.EditValue:=pFIBDataSet2['NAME'];
        cxTextEdit12.EditValue:=pFIBDataSet2['COUNT_EQUIPMENT'];
        cxTextEdit3.EditValue:=pFIBDataSet2['NOMBER'];
        cxDateEdit1.EditValue:=pFIBDataSet2['DATE_SPIS'];
        cxTextEdit5.EditValue:=pFIBDataSet2['NOMBER_DOC_SPIS'];
      end;
    end;
end;

procedure TFEditEQUIPMENT.Action1Execute(Sender: TObject);
begin

if (VarToStr(cxTextEdit1.EditValue)='') then
    begin
      showmessage('Поле "Наименование" не заполнено!');
      exit;
    end;

if (VarToStr(cxTextEdit12.EditValue)='') then
    begin
      showmessage('Поле "Количество" не заполнено!');
      exit;
    end;

if (VarToStr(cxTextEdit3.EditValue)='') then
    begin
      showmessage('Поле "Номер" не заполнено!');
      exit;
    end;



with DM do
  try
    pFIBStoredProc1.Transaction.StartTransaction;
    case ParamLoc.fs of
      garfsInsert: pFIBStoredProc1.StoredProcName:='GAR_EQUIPMENT_I';
      garfsUpdate: pFIBStoredProc1.StoredProcName:='GAR_EQUIPMENT_U';
    end;
    pFIBStoredProc1.Prepare;

    pFIBStoredProc1.ParamByName('NAME').AsVariant := cxTextEdit1.EditValue;
    pFIBStoredProc1.ParamByName('COUNT_EQUIPMENT').AsVariant := cxTextEdit12.EditValue;
    pFIBStoredProc1.ParamByName('NOMBER').AsVariant :=cxTextEdit3.EditValue;
    pFIBStoredProc1.ParamByName('ID_AVTO').AsInt64:=pFIBDataSet1['ID_AVTO'];
    pFIBStoredProc1.ParamByName('ID_NOM_BASE').AsInt64:=-1;



    case ParamLoc.fs of
     garfsUpdate:
       pFIBStoredProc1.ParamByName('ID_GAR_EQUIPMENT').AsInt64   := pFIBDataSet2['ID_GAR_EQUIPMENT']
    end;

    pFIBStoredProc1.ExecProc;
    if ParamLoc.fs=garfsInsert then ParamLoc.ID_GAR_EQUIPMENT:=pFIBStoredProc1.ParamByName('ID_GAR_EQUIPMENT').AsInt64;
    pFIBStoredProc1.Transaction.Commit;
  except
    on e:Exception do
      begin
        grShowMessage(ECaption[LanguageIndex],e.message,mtError,[mbOk]);
        pFIBStoredProc1.Transaction.RollBack;
      end;
  end;

    FEditEQUIPMENT.ModalResult:=mrYes;
end;

procedure TFEditEQUIPMENT.cxButton2Click(Sender: TObject);
begin
  modalResult:=mrCancel;
end;

procedure TFEditEQUIPMENT.Action2Execute(Sender: TObject);
begin
      if  cxButton1.Focused Then Action1Execute(Sender);
      if  cxButton2.Focused Then cxButton2Click(Sender);
      SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

end.
