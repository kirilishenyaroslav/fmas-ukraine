unit VzyskADD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, StdCtrls, cxButtons,StudcityConst, DB, FIBDataSet,
  pFIBDataSet,St_ser_function;

type
  TfrmVzyskADD = class(TForm)
    cxTextEditNameVzysk: TcxTextEdit;
    cxLabelNameVzysk: TcxLabel;
    cxButtonOk: TcxButton;
    cxButtonExit: TcxButton;
    pFIBDataSetLoadVzysk: TpFIBDataSet;
    procedure cxButtonExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(Aowner:Tcomponent;id_vzysk:Int64;Language:Integer);overload;
    { Public declarations }
  end;

var
  frmVzyskADD: TfrmVzyskADD;
  id_v:Int64;
  Lang:Integer;

implementation
uses
  SpNarush;
{$R *.dfm}
constructor TfrmVzyskADD.Create(Aowner:Tcomponent;id_vzysk:Int64;Language:Integer);
begin
  Inherited Create(Aowner);
  id_v:=id_vzysk;
  Lang:=Language;
end;

procedure TfrmVzyskADD.cxButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVzyskADD.FormCreate(Sender: TObject);
begin
cxButtonOk.Caption:=StudcityConst.Studcity_ACTION_SAVE_CONST_EX[lang];
cxButtonExit.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[lang];
cxLabelNameVzysk.Caption:=StudcityConst.Studcity_SpNarushVzysk_EX[lang];
if (id_v=-1) then//добавляем взыскание
  begin
    Caption:=StudcityConst.Studcity_SpVzyskAdd_EX[lang];
  end;
if (id_v>0) then// редактируем взыскание
  begin
    Caption:=StudcityConst.Studcity_SpVzyskhEdit_EX[lang];
    pFIBDataSetLoadVzysk.Database:=TfrmSpNarush(Self.Owner).Database;
    pFIBDataSetLoadVzysk.Transaction:=TfrmSpNarush(Self.Owner).ReadTransaction;
    pFIBDataSetLoadVzysk.Active:=false;
    pFIBDataSetLoadVzysk.ParamByName('param_vzysk').AsInt64:=id_v;
    pFIBDataSetLoadVzysk.Active:=true;
    cxTextEditNameVzysk.Text:=pFIBDataSetLoadVzysk.FieldValues['name_vzysk'];
  end;
end;

procedure TfrmVzyskADD.cxButtonOkClick(Sender: TObject);
begin
if (id_v=-1) then//добавляем взыскание
  begin
    if (cxTextEditNameVzysk.Text='') then
      begin
        exit;
      end;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.Database:=TfrmSpNarush(Self.Owner).Database;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.Transaction:=TfrmSpNarush(Self.Owner).WriteTransaction;
    TfrmSpNarush(Self.Owner).WriteTransaction.StartTransaction;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.StoredProcName:='ST_SP_VZYSK_INSERT';
    TfrmSpNarush(Self.Owner).pFIBStoredProc.Prepare;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.ParamByName('name_vzysk').AsString:=cxTextEditNameVzysk.Text;
    try
      TfrmSpNarush(Self.Owner).pFIBStoredProc.ExecProc;
      except
        begin
          TfrmSpNarush(Self.Owner).WriteTransaction.Rollback;
        end;
     end;
     TfrmSpNarush(Self.Owner).WriteTransaction.Commit;
     Close;
  end;
if (id_v>0) then//РЕДАКТИРУЕМ взыскание
  begin
    if (cxTextEditNameVzysk.Text='') then
      begin
        exit;
      end;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.Database:=TfrmSpNarush(Self.Owner).Database;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.Transaction:=TfrmSpNarush(Self.Owner).WriteTransaction;
    TfrmSpNarush(Self.Owner).WriteTransaction.StartTransaction;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.StoredProcName:='ST_SP_VZYSK_EDIT';
    TfrmSpNarush(Self.Owner).pFIBStoredProc.Prepare;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.ParamByName('id_vzysk').AsInt64:=id_v;
    TfrmSpNarush(Self.Owner).pFIBStoredProc.ParamByName('name_vzysk').AsString:=cxTextEditNameVzysk.Text;
    try
      TfrmSpNarush(Self.Owner).pFIBStoredProc.ExecProc;
      except
        begin
          TfrmSpNarush(Self.Owner).WriteTransaction.Rollback;
        end;
     end;
     TfrmSpNarush(Self.Owner).WriteTransaction.Commit;
     Close;
  end;

end;

end.
