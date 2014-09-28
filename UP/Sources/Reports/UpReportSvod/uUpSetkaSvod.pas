unit uUpSetkaSvod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  cxClasses, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, ImgList,
  dxBar, ExtCtrls, dxBarExtItems,pFibStoredProc, cxContainer, cxTextEdit,pFibDataSet;

type
  TdmSetka = class(TForm)
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    ContentError: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    SetkaDataSource: TDataSource;
    SetkaGrid: TcxGrid;
    SetkaView: TcxGridDBTableView;
    DN_LIMColumn: TcxGridDBColumn;
    UP_LIMColumn: TcxGridDBColumn;
    SetkaLevel: TcxGridLevel;
    cxButtonParam: TcxButton;
    cxButtonDraft: TcxButton;
    ActionList1: TActionList;
    OKAction: TAction;
    CancelAction: TAction;
    dxBarManager1: TdxBarManager;
    dxAddButton: TdxBarLargeButton;
    dxDelButton: TdxBarLargeButton;
    dxDelButtonOne: TdxBarLargeButton;
    dxDelButtonAll: TdxBarLargeButton;
    dxEditPositionButton: TdxBarLargeButton;
    Panel1: TPanel;
    dxBarDockControl1: TdxBarDockControl;
    Panel2: TPanel;
    IL_OrdAcc: TImageList;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxNewButton: TdxBarLargeButton;
    dxPrevButton: TdxBarLargeButton;
    dxBarPopupMenu3: TdxBarPopupMenu;
    dxNextButton: TdxBarLargeButton;
    procedure OKActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure dxAddButtonClick(Sender: TObject);
    procedure dxEditPositionButtonClick(Sender: TObject);
    procedure dxDelButtonClick(Sender: TObject);
    procedure dxDelButtonAllClick(Sender: TObject);
    procedure dxNewButtonClick(Sender: TObject);
    procedure dxPrevButtonClick(Sender: TObject);
    procedure dxNextButtonClick(Sender: TObject);
    procedure SetkaViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    id_rec  :Integer;
    N_SETKA,N_SETKA_LIST, N_SETKA_MAX :Integer;
    constructor Create(aOwner : TComponent; N_Base_Setka : Integer);
  end;

var
  dmSetka: TdmSetka;

implementation
uses uUpAddSetka,BaseTypes,dmReportSvod, UpKernelUnit;
{$R *.dfm}

procedure TdmSetka.OKActionExecute(Sender: TObject);
begin

    ModalResult:=mrOk;
end;

procedure TdmSetka.CancelActionExecute(Sender: TObject);
begin
    ModalResult:=mrNo;
end;

procedure TdmSetka.dxAddButtonClick(Sender: TObject);
var InsertSP:TpFIBStoredProc;
begin
    with  TdmAddSetka.Create(self) do
    begin
         if ShowModal=mrOk
         then begin
                  InsertSP:=TpFibStoredProc.Create(self);
                  InsertSP.Database    :=DM.DB;
                  InsertSP.Transaction :=DM.WriteTransaction;
                  dm.WriteTransaction.StartTransaction;
                  InsertSP.StoredProcName:='UP_DT_SVOD_SETKA_INS';
                  InsertSP.Prepare;
                  InsertSP.ParamByName('DN_LIM').AsExtended  :=StrToFloat(cxDNEdit.Text);
                  InsertSP.ParamByName('UP_LIM').AsExtended  :=StrToFloat(cxUPEdit.Text);
                  InsertSP.ParamByName('N_SETKA').Value      :=N_SETKA_LIST;//dm.BaseDataSet.FieldByName('N_SETKA').AsInteger;
                  InsertSP.ExecProc;
                  InsertSP.Close;
                  InsertSP.Free;
                  dm.WriteTransaction.Commit;
         end;
         DM.SetkaDataSet.Close;
         DM.SetkaDataSet.Open;
         Free;
     end;
end;

procedure TdmSetka.dxEditPositionButtonClick(Sender: TObject);
var  frm : TdmAddSetka;
     UpdateSP:TpFIBStoredProc;
begin
    if (DM.SetkaDataSet.RecordCount>0)
    then
    begin
        frm := TdmAddSetka.Create(Self);
        frm.cxDNEdit.Text:=DM.SetkaDataSet.FieldByName('DN_LIM').AsString;
        frm.cxUPEdit.Text:=DM.SetkaDataSet.FieldByName('UP_LIM').AsString;
        if frm.ShowModal = mrOk then
        begin
            UpdateSP:=TpFibStoredProc.Create(self);
            UpdateSP.Database    :=DM.DB;
            UpdateSP.Transaction :=DM.WriteTransaction;
            dm.WriteTransaction.StartTransaction;
            UpdateSP.StoredProcName:='UP_DT_SVOD_SETKA_UPD';
            UpdateSP.Prepare;
            UpdateSP.ParamByName('ID_SETKA_PV').asInt64:=StrToInt64(DM.SetkaDataSet.FieldByName('ID_SETKA_PV').AsString);
            UpdateSP.ParamByName('DN_LIM').AsExtended  :=StrToFloat(frm.cxDNEdit.Text);
            UpdateSP.ParamByName('UP_LIM').AsExtended  :=StrToFloat(frm.cxUPEdit.Text);
            UpdateSP.ExecProc;
            UpdateSP.Close;
            UpdateSP.Free;
            Dm.WriteTransaction.Commit;
        end;
          DM.SetkaDataSet.Close;
          DM.SetkaDataSet.Open;
          frm.Free;
     end;
end;

procedure TdmSetka.dxDelButtonClick(Sender: TObject);
var DeleteSP:TpFibStoredProc;
begin
   if (DM.SetkaDataSet.RecordCount>0)
   then begin
               if (agMessageDlg('Увага!','Ви хочете видалити запис?',mtConfirmation,[mbYes,mbNo])=mrYes)
               then begin
                         DeleteSP:=TpFibStoredProc.Create(self);
                         DeleteSP.Database    :=DM.DB;
                         DeleteSP.Transaction :=DM.WriteTransaction;
                         DM.WriteTransaction.StartTransaction;
                         DeleteSP.StoredProcName:='UP_DT_SVOD_SETKA_DEL';
                         DeleteSP.Prepare;
                         DeleteSP.ParamByName('ID_SETKA_PV').asInt64  :=StrToInt64(DM.SetkaDataSet.FieldByName('ID_SETKA_PV').AsString);
                         DeleteSP.ExecProc;
                         DeleteSP.Close;
                         DeleteSP.Free;
                         DM.WriteTransaction.Commit;
               end;
               DM.SetkaDataSet.Close;
               DM.SetkaDataSet.Open;
     end;
end;

constructor TdmSetka.Create(aOwner : TComponent; N_Base_Setka : Integer);
var SelSP:TpFibDataSet;
begin
  inherited Create(aOwner);

  SelSP:=TpFibDataSet.Create(self);
  SelSP.Database    :=DM.DB;
  SelSP.Transaction :=DM.WriteTransaction;
  DM.WriteTransaction.StartTransaction;
  SelSP.SelectSQL.Text:='Select First(1) S.N_Setka From Up_Svod_Setka_Pv S Order By S.N_Setka Desc';
  SelSP.Open;
  N_SETKA_MAX:=SelSP.FieldByName('N_Setka').AsInteger;
  SelSP.Close;
  SelSP.Free;
  DM.WriteTransaction.Commit;
  //ShowMessage('N_SETKA_MAX= '+inttostr(N_SETKA_MAX));
  N_SETKA:=N_Base_Setka;//dm.BaseDataSet.FieldByName('N_SETKA').AsInteger;
  if dm.SetkaDataSet.Active then dm.SetkaDataSet.Close;
  dm.SetkaDataSet.SelectSQL.Text:='SELECT * FROM  UP_DT_SVOD_SETKA_SEL('+IntToStr(N_SETKA)+')';
  dm.SetkaDataSet.Open;
  if N_SETKA<1 then N_SETKA:=1;
  N_SETKA_LIST:=N_SETKA;
  if (N_SETKA_LIST>1) then dxPrevButton.Enabled:=True
                    else dxPrevButton.Enabled:=False;

  if N_SETKA_LIST<N_SETKA_MAX then dxNextButton.Enabled:=True
                        else dxNextButton.Enabled:=False;
end;

procedure TdmSetka.dxDelButtonAllClick(Sender: TObject);
var DeleteSP:TpFibStoredProc;
begin
   if (DM.SetkaDataSet.RecordCount>0)
   then begin
               if (agMessageDlg('Увага!','Ви хочете видалити запис?',mtConfirmation,[mbYes,mbNo])=mrYes)
               then begin
                         DeleteSP:=TpFibStoredProc.Create(self);
                         DeleteSP.Database    :=DM.DB;
                         DeleteSP.Transaction :=DM.WriteTransaction;
                         DM.WriteTransaction.StartTransaction;
                         DeleteSP.StoredProcName:='UP_DT_SVOD_SETKA_ALL_DEL';
                         DeleteSP.Prepare;
                         DeleteSP.ParamByName('N_Setka').asInt64  :=N_SETKA_LIST;//dm.BaseDataSet.FieldByName('N_SETKA').AsInteger;
                         DeleteSP.ExecProc;
                         DeleteSP.Close;
                         DeleteSP.Free;
                         DM.WriteTransaction.Commit;
               end;
               DM.SetkaDataSet.Close;
               DM.SetkaDataSet.Open;
     end;
end;

procedure TdmSetka.dxNewButtonClick(Sender: TObject);
begin
    N_SETKA_LIST:=N_SETKA_MAX+1;
    N_SETKA_MAX:=N_SETKA_LIST;
    if dm.SetkaDataSet.Active then dm.SetkaDataSet.Close;
    dm.SetkaDataSet.SelectSQL.Text:='SELECT * FROM  UP_DT_SVOD_SETKA_SEL('+IntToStr(N_SETKA_LIST)+')';
    dm.SetkaDataSet.Open;
    dxPrevButton.Enabled:=True;
end;

procedure TdmSetka.dxPrevButtonClick(Sender: TObject);
begin
    //ShowMessage('N_SETKA_LIST= '+IntToStr(N_SETKA_LIST));
    if (N_SETKA_LIST>1) then
    begin
        N_SETKA_LIST:=N_SETKA_LIST-1;
        if dm.SetkaDataSet.Active then dm.SetkaDataSet.Close;
        dm.SetkaDataSet.SelectSQL.Text:='SELECT * FROM  UP_DT_SVOD_SETKA_SEL('+IntToStr(N_SETKA_LIST)+')';
        dm.SetkaDataSet.Open;
    end;
    if (N_SETKA_LIST>1) then dxPrevButton.Enabled:=True
                        else dxPrevButton.Enabled:=False;

    if N_SETKA_LIST<N_SETKA_MAX then dxNextButton.Enabled:=True
                            else dxNextButton.Enabled:=False;

end;

procedure TdmSetka.dxNextButtonClick(Sender: TObject);
begin
       //ShowMessage('N_SETKA_LIST= '+IntToStr(N_SETKA_LIST));
       //ShowMessage('N_SETKA_MAX= '+IntToStr(N_SETKA_MAX));
        if N_SETKA_LIST<N_SETKA_MAX then
        begin
            N_SETKA_LIST:=N_SETKA_LIST+1;
            if dm.SetkaDataSet.Active then dm.SetkaDataSet.Close;
            dm.SetkaDataSet.SelectSQL.Text:='SELECT * FROM  UP_DT_SVOD_SETKA_SEL('+IntToStr(N_SETKA_LIST)+')';
            dm.SetkaDataSet.Open;
        end;
        if (N_SETKA_LIST>1) then dxPrevButton.Enabled:=True
                            else dxPrevButton.Enabled:=False;

        if N_SETKA_LIST<N_SETKA_MAX then dxNextButton.Enabled:=True
                                else dxNextButton.Enabled:=False;
end;

procedure TdmSetka.SetkaViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      If ((Key = VK_INSERT) And (dxAddButton.Enabled))
      Then dxAddButtonClick(self);

      If ((Key = VK_F2) And (dxEditPositionButton.Enabled))
      Then dxEditPositionButtonClick(self);

      If ((Key = VK_DELETE) And (dxDelButton.Enabled))
      Then dxDelButtonClick(self);

      If (Key = VK_F5)
      Then agShowMessage('N_SETKA_LIST= '+IntToStr(N_SETKA_LIST));

    If ((Key = VK_F12) And (ssShift In Shift))
        Then Begin
            ShowInfo(DM.SetkaDataSet);
        End;
end;

end.
