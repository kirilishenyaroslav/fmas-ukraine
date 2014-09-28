unit BankValutaSchMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase,DB,ExtCtrls, dxBar, dxBarExtItems, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, Buttons, cxPC, cxGridBandedTableView, cxGridDBBandedTableView,
  cxCheckBox;

type
  TBankSchValutaMainForm = class(TForm)
    StyleRepository: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DB_VALUTE_TITLE: TcxGridDBColumn;
    cxGrid1DBTableView1DB_SPECIAL_SIGN: TcxGridDBColumn;
    cxGrid1DBTableView1DB_CODE_VALUTE: TcxGridDBColumn;
    cxGrid1DBTableView1DB_DATE_KURS: TcxGridDBColumn;
    cxGrid1DBTableView1DB_KURS: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel2: TPanel;
    Panel3: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1DB_sch_number: TcxGridDBColumn;
    cxGrid2DBTableView1DB_sch_title: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel4: TPanel;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid3DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid3DBBandedTableView1DBBanded_sch_number: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBanded_SCH_TITLE: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBanded_month_open: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBanded_IS_BLOCKED: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBanded_valute_title: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBanded_special_sign: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBanded_code_valute: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBanded_date_kurs: TcxGridDBBandedColumn;
    cxGrid3DBBandedTableView1DBBanded_KURS: TcxGridDBBandedColumn;
    AddBitBtn: TBitBtn;
    RefreshBitBtn: TBitBtn;
    DelBitBtn: TBitBtn;
    OnovitiBitBtn: TBitBtn;
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure AddKursButtonClick(Sender: TObject);
    procedure EditKursButtonClick(Sender: TObject);
    procedure DelKursButtonClick(Sender: TObject);
    procedure DelValutaButtonClick(Sender: TObject);
    procedure AddValutaButtonClick(Sender: TObject);
    procedure EditValutaButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DelBitBtnClick(Sender: TObject);
    procedure AddBitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshBitBtnClick(Sender: TObject);
    procedure OnovitiBitBtnClick(Sender: TObject);
  private
    PRes       :Variant;
    PDb_Handle :TISC_DB_HANDLE;
  public
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
    property Res:Variant read PRes;
  end;

var
  BankSchValutaMainForm: TBankSchValutaMainForm;

implementation

uses BankValutaSchDM,BankValutaSchAdd,BankBalSchValAdd;

{$R *.dfm}
constructor TBankSchValutaMainForm.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  PDb_Handle    := Db_Handle;
  BankValutaSch_DM := TBankValutaSch_DM.Create(AOwner,Db_Handle);
//******************************************************************************
  RefreshBitBtn.Click;
end;

procedure TBankSchValutaMainForm.dxBarLargeButton4Click(Sender: TObject);
begin
  Close;
end;

procedure TBankSchValutaMainForm.AddKursButtonClick(Sender: TObject);
var
  ViewForm : TBankValutaSchAddForm;
  id : Integer;
begin
  ViewForm := TBankValutaSchAddForm.Create(Self);
  ViewForm.cxLabelTitleValuta.Caption := BankValutaSch_DM.ValutaDSet['VALUTE_TITLE'];;
  ViewForm.BankSchetEdit.Text         := '';
  ViewForm.ShowModal;

  if (ViewForm.ModalResult = mrOk) then
  begin
    //**проверка на то, что до этого с таким же балансовым счетом не была связана валюта**//
    //*********************************************************************************//
    BankValutaSch_DM.TransWrite.StartTransaction;
    BankValutaSch_DM.StoredProc.StoredProcName                 := 'BANK_BALANSE_SCH_VALUTE_INS';
    BankValutaSch_DM.StoredProc.ParamByName('id_valute').Value := BankValutaSch_DM.ValutaDSet['id_valute'];
    BankValutaSch_DM.StoredProc.ParamByName('ID_SCH').AsInt64  := ViewForm.id_sch;
    BankValutaSch_DM.StoredProc.ExecProc;
    BankValutaSch_DM.TransWrite.Commit;
    id := BankValutaSch_DM.StoredProc.ParamByName('id_balanse_sch_valute').Value;
    BankValutaSch_DM.ValutaSchDSet.Close;
    BankValutaSch_DM.ValutaSchDSet.Open;
    BankValutaSch_DM.ValutaSchDSet.Locate('id_balanse_sch_valute', IntToStr(id),[]);
  end;
end;

procedure TBankSchValutaMainForm.EditKursButtonClick(Sender: TObject);
var
 // ViewForm : TBankValutaKursAddForm;
  id : Integer;
begin
 { ViewForm := TBankValutaKursAddForm.Create(Self);
  ViewForm.cxLabelValuta.Caption := BankValutaSch_DM.ValutaDSet['VALUTE_TITLE'];
  ViewForm.cxKurs.Value          := BankValutaSch_DM.ValutaKursDSet['KURS'];
  ViewForm.cxDateEdit.Date       := BankValutaSch_DM.ValutaKursDSet['DATE_KURS'];
  ViewForm.ShowModal;

  if (ViewForm.ModalResult = mrOk) then
  begin
    //**проверка на то, что до этого с такой же валютой курс не был введен на эту дату**//
    //*********************************************************************************//
    id := BankValutaSch_DM.ValutaKursDSet['ID_KURS'];
    BankValutaSch_DM.TransWrite.StartTransaction;
    BankValutaSch_DM.StoredProc.StoredProcName                 := 'PUB_DT_VALUTE_KURS_UPD';
    BankValutaSch_DM.StoredProc.ParamByName('is_upd').Value    := 1 ;
    BankValutaSch_DM.StoredProc.ParamByName('id_valute').Value := BankValutaSch_DM.ValutaDSet['id_valute'];
    BankValutaSch_DM.StoredProc.ParamByName('KURS').Value      := ViewForm.cxKurs.Value;
    BankValutaSch_DM.StoredProc.ParamByName('DATE_KURS').Value := ViewForm.cxDateEdit.Date;
    BankValutaSch_DM.StoredProc.ExecProc;
    BankValutaSch_DM.TransWrite.Commit;
    BankValutaSch_DM.ValutaKursDSet.Close;
    BankValutaSch_DM.ValutaKursDSet.Open;
    BankValutaSch_DM.ValutaKursDSet.Locate('ID_KURS', IntToStr(id),[]);
  end;  }
end;

procedure TBankSchValutaMainForm.DelKursButtonClick(Sender: TObject);
begin
  if MessageDlg('Ви дійсно бажаєте вилучити настроювання?',mtConfirmation,[mbYes, mbNo],0)=mrYes then
   begin
    try
      BankValutaSch_DM.TransWrite.StartTransaction;
      BankValutaSch_DM.StoredProc.StoredProcName:='BANK_BALANSE_SCH_VALUTE_DEL';
      BankValutaSch_DM.StoredProc.ParamByName('id_balanse_sch_valute').Value:=BankValutaSch_DM.ValutaSchDSet['id_balanse_sch_valute'];
      BankValutaSch_DM.StoredProc.ExecProc;
      BankValutaSch_DM.TransWrite.Commit;
      BankValutaSch_DM.ValutaSchDSet.close;
      BankValutaSch_DM.ValutaSchDSet.OPen;
    except on E:Exception do
     begin
       MessageDlg('не можна видалити цей запис', mtError, [mbOK],0);
       BankValutaSch_DM.TransWrite.Rollback;
     end;
    end;
   end;
end;

procedure TBankSchValutaMainForm.DelValutaButtonClick(Sender: TObject);
begin
  if MessageDlg('Ви дійсно бажаєте вилучити валюту?',mtConfirmation,[mbYes, mbNo],0)=mrYes then
   begin
    try
      BankValutaSch_DM.TransWrite.StartTransaction;
      BankValutaSch_DM.StoredProc.StoredProcName:='PUB_SP_VALUTE_DELETE';
      BankValutaSch_DM.StoredProc.ParamByName('ID_VALUTE').Value:=BankValutaSch_DM.ValutaDSet['ID_VALUTE'];
      BankValutaSch_DM.StoredProc.ExecProc;
      BankValutaSch_DM.TransWrite.Commit;
      BankValutaSch_DM.ValutaDSet.Close;
      BankValutaSch_DM.ValutaSchDSet.Close;
      BankValutaSch_DM.ValutaDSet.Open;
      BankValutaSch_DM.ValutaSchDSet.Open;
    except on E:Exception do
     begin
       MessageDlg('не можна видалити цей запис', mtError, [mbOK],0);
       BankValutaSch_DM.TransWrite.Rollback;
     end;
    end;
   end;
end;

procedure TBankSchValutaMainForm.AddValutaButtonClick(Sender: TObject);
var
  ViewForm : TBankValutaSchAddForm;
  id : Integer;
begin
 { ViewForm := TBankValutaSchAddForm.Create(Self);
  ViewForm.TitleValuteTextEdit.Text := '';
  ViewForm.CodeValuteTextEdit.Text  := '';
  ViewForm.SpecialSignTextEdit.Text := '';
  ViewForm.ShowModal;

  if (ViewForm.ModalResult = mrOk) then
  begin
    BankValutaSch_DM.TransWrite.StartTransaction;
    BankValutaSch_DM.StoredProc.StoredProcName                    := 'PUB_SP_VALUTE_INSERT';
    BankValutaSch_DM.StoredProc.ParamByName('CODE_VALUTE').Value  := ViewForm.CodeValuteTextEdit.Text;
    BankValutaSch_DM.StoredProc.ParamByName('VALUTE_TITLE').Value := ViewForm.TitleValuteTextEdit.Text;
    BankValutaSch_DM.StoredProc.ParamByName('SPECIAL_SIGN').Value := ViewForm.SpecialSignTextEdit.Text;
    BankValutaSch_DM.StoredProc.ExecProc;
    BankValutaSch_DM.TransWrite.Commit;
    id := BankValutaSch_DM.StoredProc.ParamByName('ID_VALUTE').Value;
    BankValutaSch_DM.ValutaDSet.Close;
    BankValutaSch_DM.ValutaKursDSet.Close;
    BankValutaSch_DM.ValutaDSet.Open;
    BankValutaSch_DM.ValutaKursDSet.Open;
    BankValutaSch_DM.ValutaDSet.Locate('ID_VALUTE', IntToStr(id),[]);
  end; }
end;

procedure TBankSchValutaMainForm.EditValutaButtonClick(Sender: TObject);
var
  ViewForm : TBankValutaSchAddForm;
  id : Integer;
begin
 { ViewForm := TBankValutaSchAddForm.Create(Self);
  ViewForm.TitleValuteTextEdit.Text := BankValutaSch_DM.ValutaDSet['VALUTE_TITLE'];
  ViewForm.CodeValuteTextEdit.Text  := BankValutaSch_DM.ValutaDSet['CODE_VALUTE'];

  if (BankValutaSch_DM.ValutaDSet['SPECIAL_SIGN']<> null) then
    ViewForm.SpecialSignTextEdit.Text := BankValutaSch_DM.ValutaDSet['SPECIAL_SIGN']
  else
    ViewForm.SpecialSignTextEdit.Text := '';

  ViewForm.ShowModal;

  if (ViewForm.ModalResult = mrOk) then
  begin
    id := BankValutaSch_DM.ValutaDSet['ID_VALUTE'];
    BankValutaSch_DM.TransWrite.StartTransaction;
    BankValutaSch_DM.StoredProc.StoredProcName                    := 'PUB_SP_VALUTE_UPDATE';
    BankValutaSch_DM.StoredProc.ParamByName('ID_VALUTE').Value    := BankValutaSch_DM.ValutaDSet['ID_VALUTE'];
    BankValutaSch_DM.StoredProc.ParamByName('CODE_VALUTE').Value  := ViewForm.CodeValuteTextEdit.Text;
    BankValutaSch_DM.StoredProc.ParamByName('VALUTE_TITLE').Value := ViewForm.TitleValuteTextEdit.Text;
    BankValutaSch_DM.StoredProc.ParamByName('SPECIAL_SIGN').Value := ViewForm.SpecialSignTextEdit.Text;
    BankValutaSch_DM.StoredProc.ExecProc;
    BankValutaSch_DM.TransWrite.Commit;
    id := BankValutaSch_DM.StoredProc.ParamByName('ID_VALUTE').Value;
    BankValutaSch_DM.ValutaDSet.Close;
    BankValutaSch_DM.ValutaKursDSet.Close;
    BankValutaSch_DM.ValutaDSet.Open;
    BankValutaSch_DM.ValutaKursDSet.Open;
    BankValutaSch_DM.ValutaDSet.Locate('ID_VALUTE', IntToStr(id),[]);
  end;   }
end;

procedure TBankSchValutaMainForm.BitBtn1Click(Sender: TObject);
var
  ViewForm : TBankValutaSchAddForm;
  id : Integer;
begin
  ViewForm := TBankValutaSchAddForm.Create(Self);
  ViewForm.cxLabelTitleValuta.Caption := BankValutaSch_DM.ValutaDSet['VALUTE_TITLE'];;
  ViewForm.BankSchetEdit.Text         := '';
  ViewForm.ShowModal;

  if (ViewForm.ModalResult = mrOk) then
  begin
    //**проверка на то, что до этого с таким же балансовым счетом не была связана валюта**//
    //*********************************************************************************//
    BankValutaSch_DM.TransWrite.StartTransaction;
    BankValutaSch_DM.StoredProc.StoredProcName                 := 'BANK_BALANSE_SCH_VALUTE_INS';
    BankValutaSch_DM.StoredProc.ParamByName('id_valute').Value := BankValutaSch_DM.ValutaDSet['id_valute'];
    BankValutaSch_DM.StoredProc.ParamByName('ID_SCH').AsInt64  := ViewForm.id_sch;
    BankValutaSch_DM.StoredProc.ExecProc;
    BankValutaSch_DM.TransWrite.Commit;
    id := BankValutaSch_DM.StoredProc.ParamByName('id_balanse_sch_valute').Value;
    BankValutaSch_DM.ValutaSchDSet.Close;
    BankValutaSch_DM.ValutaSchDSet.Open;
    BankValutaSch_DM.ValutaSchDSet.Locate('id_balanse_sch_valute', IntToStr(id),[]);
  end;
end;

procedure TBankSchValutaMainForm.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Ви дійсно бажаєте вилучити настроювання?',mtConfirmation,[mbYes, mbNo],0)=mrYes then
   begin
    try
      BankValutaSch_DM.TransWrite.StartTransaction;
      BankValutaSch_DM.StoredProc.StoredProcName:='BANK_BALANSE_SCH_VALUTE_DEL';
      BankValutaSch_DM.StoredProc.ParamByName('id_balanse_sch_valute').Value:=BankValutaSch_DM.ValutaSchDSet['id_balanse_sch_valute'];
      BankValutaSch_DM.StoredProc.ExecProc;
      BankValutaSch_DM.TransWrite.Commit;
      BankValutaSch_DM.ValutaSchDSet.close;
      BankValutaSch_DM.ValutaSchDSet.OPen;
    except on E:Exception do
     begin
       MessageDlg('не можна видалити цей запис', mtError, [mbOK],0);
       BankValutaSch_DM.TransWrite.Rollback;
     end;
    end;
   end;
end;

procedure TBankSchValutaMainForm.DelBitBtnClick(Sender: TObject);
begin
  if MessageDlg('Ви дійсно бажаєте вилучити настроювання?',mtConfirmation,[mbYes, mbNo],0)=mrYes then
   begin
    try
      BankValutaSch_DM.TransWrite.StartTransaction;
      BankValutaSch_DM.StoredProc.StoredProcName:='BANK_BALANSE_SCH_VALUTE_DEL';
      BankValutaSch_DM.StoredProc.ParamByName('id_balanse_sch_valute').Value:=BankValutaSch_DM.BalSchetValDSet['id_balanse_sch_valute'];
      BankValutaSch_DM.StoredProc.ExecProc;
      BankValutaSch_DM.TransWrite.Commit;
      BankValutaSch_DM.BalSchetValDSet.close;
      BankValutaSch_DM.BalSchetValDSet.OPen;
    except on E:Exception do
     begin
       MessageDlg('не можна видалити цей запис', mtError, [mbOK],0);
       BankValutaSch_DM.TransWrite.Rollback;
     end;
    end;
   end;
end;

procedure TBankSchValutaMainForm.AddBitBtnClick(Sender: TObject);
var
  ViewForm : TBalSchValAddForm;
  id : Integer;
begin
  ViewForm := TBalSchValAddForm.Create(Self);
  ViewForm.ValutaButtonEdit.Text := '';
  ViewForm.BankSchetEdit.Text    := '';
  ViewForm.id_valute := 0;
  ViewForm.ShowModal;

  if (ViewForm.ModalResult = mrOk) then
  begin
    //**проверка на то, что до этого с таким же балансовым счетом не была связана валюта**//
    //*********************************************************************************//
    BankValutaSch_DM.TransWrite.StartTransaction;
    BankValutaSch_DM.StoredProc.StoredProcName                 := 'BANK_BALANSE_SCH_VALUTE_INS';
    BankValutaSch_DM.StoredProc.ParamByName('id_valute').AsInt64 := ViewForm.id_valute;
    BankValutaSch_DM.StoredProc.ParamByName('ID_SCH').AsInt64  := ViewForm.id_sch;
    BankValutaSch_DM.StoredProc.ExecProc;
    BankValutaSch_DM.TransWrite.Commit;
    id := BankValutaSch_DM.StoredProc.ParamByName('id_balanse_sch_valute').Value;
    BankValutaSch_DM.BalSchetValDSet.Close;
    BankValutaSch_DM.BalSchetValDSet.Open;
    BankValutaSch_DM.BalSchetValDSet.Locate('id_balanse_sch_valute', IntToStr(id),[]);
  end;
end;

procedure TBankSchValutaMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if formStyle = fsMDIChild then Action := CaFree;
end;

procedure TBankSchValutaMainForm.RefreshBitBtnClick(Sender: TObject);
begin
  BankValutaSch_DM.ValutaDSet.Close;
  BankValutaSch_DM.ValutaSchDSet.Close;
  BankValutaSch_DM.BalSchetValDSet.Close;
  BankValutaSch_DM.ValutaDSet.SelectSQL.Text    := 'SELECT * FROM PUB_SP_VALUTE_SEL order by valute_title';
  BankValutaSch_DM.ValutaSchDSet.SelectSQL.Text := 'select * from BANK_BALANSE_SCH_VALUTE_SEL where id_valute=:id_valute';
  BankValutaSch_DM.BalSchetValDSet.SelectSQL.Text := 'select * from BANK_BALANSE_SCH_VALUTE_SEL';
  BankValutaSch_DM.ValutaDSet.Open;
  BankValutaSch_DM.ValutaSchDSet.Open;
  BankValutaSch_DM.BalSchetValDSet.Open;
end;

procedure TBankSchValutaMainForm.OnovitiBitBtnClick(Sender: TObject);
begin
  RefreshBitBtn.Click;
end;

end.
