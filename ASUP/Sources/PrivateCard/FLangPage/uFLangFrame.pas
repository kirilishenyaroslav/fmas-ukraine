unit uFLangFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, uFLangDataModule, Buttons, ExtCtrls,
  ActnList, cxContainer, cxTextEdit, cxMemo, UpKernelUnit;

type
  TfmPCardFLangPage = class(TFrame)
    FLangGrid: TcxGrid;
    FLangView: TcxGridDBTableView;
    FLangGridLevel1: TcxGridLevel;
    StyleRepository: TcxStyleRepository;
    FLangViewNAME_FLang: TcxGridDBColumn;
    FLangViewName_degree: TcxGridDBColumn;
    Panel11: TPanel;
    SB_AddFLang: TSpeedButton;
    SB_DelFLang: TSpeedButton;
    SB_ModifFLang: TSpeedButton;
    ALFLang: TActionList;
    AddFLangA: TAction;
    ModifFLangA: TAction;
    DelFLangA: TAction;
    ShowInformation: TAction;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxMemo1: TcxMemo;
    procedure AddFLangAExecute(Sender: TObject);
    procedure ModifFLangAExecute(Sender: TObject);
    procedure DelFLangAExecute(Sender: TObject);
    procedure FLangViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FrameExit(Sender: TObject);
    procedure FrameEnter(Sender: TObject);
  private
    { Private declarations }
  public
    DM:TdmFLang;
    id_pcard:integer;
    constructor Create(AOwner: TComponent; DMod: TdmFLang; Id_PC: Integer; modify :integer); reintroduce;
  end;

implementation

uses uFLangAdd;
{$R *.dfm}

constructor TfmPCardFLangPage.Create(AOwner: TComponent; DMod: TdmFLang; Id_PC: Integer; modify :integer);
begin
    inherited Create(AOwner);
    DM:=Dmod; id_pcard:=Id_PC;
    DM.FLangSelect.ParamByName('Id_PCard').AsInteger := Id_PCard;
    FLangView.DataController.DataSource := DM.FLangSource;
    DM.FLangSelect.Open;
    DM.pFIBDS_IsShow.Open;
    cxMemo1.Visible:=(DM.pFIBDS_IsShow['use_kadry_language']='T');
    DM.pFIBDS_IsShow.Close;

    if cxMemo1.Visible then
     begin
       DM.pFIBDS_OldLang.ParamByName('id_pcard').AsInteger := Id_PCard;
       DM.pFIBDS_OldLang.Open;
       if not VarIsNull(DM.pFIBDS_OldLang['lang'])
        then cxMemo1.Text:=DM.pFIBDS_OldLang['lang'] 
        else cxMemo1.Visible:=False;
       DM.pFIBDS_OldLang.Close;
     end;
     
    if (modify=0) then
     begin
       AddFLangA.Enabled:=False;
       DelFLangA.Enabled:=False;
       ModifFLangA.Enabled:=False;
     end;
end;

procedure TfmPCardFLangPage.AddFLangAExecute(Sender: TObject);
var  AForm: TAddFLangForm;
begin
  AForm:=TAddFLangForm.Create(Self);
  AForm.Add:=True;
  AForm.id_pcard:=id_pcard;
  AForm.DM := DM;
  AForm.ShowModal;
  if AForm.ModalResult=mrOk then
   begin
     DM.FLangSelect.Close;
     DM.FLangSelect.Open;
   end;
  AForm.Free;
end;

procedure TfmPCardFLangPage.ModifFLangAExecute(Sender: TObject);
var  AForm: TAddFLangForm;
begin
  if DM.FLangSelect.IsEmpty then Exit;
  AForm:=TAddFLangForm.Create(Self);
  AForm.Add:=False;
  AForm.id_pcard:=id_pcard;
  AForm.DM := DM;
  AForm.id:=DM.FLangSelect['id_man_FLang'];
  AForm.SpCB_FLang.Prepare(DM.FLangSelect['id_FLang'],DM.FLangSelect['name_FLang']);
  AForm.SpCB_Degree.Prepare(DM.FLangSelect['id_FLang_Degree'],DM.FLangSelect['name_Degree']);
  AForm.ShowModal;
  if AForm.ModalResult=mrOk then
   begin
     DM.FLangSelect.Close;
     DM.FLangSelect.Open;
   end;
  AForm.Free;
end;

procedure TfmPCardFLangPage.DelFLangAExecute(Sender: TObject);
begin
  if DM.FLangSelect.IsEmpty then
   begin
     MessageDlg('Не можливо видалити запис бо довідник пустий',mtError,[mbYes],0);
     Exit;
   end;
  if (MessageDlg('Чи ви справді бажаєте вилучити цей запис?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
  with DM do
  try
    DeleteQuery.Transaction.StartTransaction;
    StartHistory(Dm.DefaultTransaction);
    DeleteQuery.ParamByName('id_man_FLang').AsInteger:=FLangSelect['id_man_FLang'];
    DeleteQuery.ExecProc;
    DefaultTransaction.Commit;
  except on e: Exception do
    begin
      MessageDlg('Не вдалося видалити запис: '+#13+e.Message,mtError,[mbYes],0);
      DefaultTransaction.RollBack;
    end;
  end;
  DM.FLangSelect.Close;
  DM.FLangSelect.Open;
end;

procedure TfmPCardFLangPage.FLangViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if (( Key = VK_F12) and (ssShift in Shift)) then
     ShowInfo(FLangView.DataController.DataSource.DataSet);
end;

procedure TfmPCardFLangPage.FrameExit(Sender: TObject);
begin
     DM.ReadTransaction.CommitRetaining;
end;

procedure TfmPCardFLangPage.FrameEnter(Sender: TObject);
begin
     if not DM.ReadTransaction.InTransaction
     then DM.ReadTransaction.StartTransaction;

     if DM.FLangSelect.Active
     then DM.FLangSelect.Close;
     
     DM.FLangSelect.Open;
end;

end.
