unit BankValutaMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase,DB,ExtCtrls, dxBar, dxBarExtItems, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,Un_lo_file_Alex;

type
  TMainForm = class(TForm)
    dxBarManager1: TdxBarManager;
    AddValutaButton: TdxBarLargeButton;
    EditValutaButton: TdxBarLargeButton;
    DelValutaButton: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    SelectValutaButton: TdxBarLargeButton;
    AddKursButton: TdxBarLargeButton;
    EditKursButton: TdxBarLargeButton;
    DelKursButton: TdxBarLargeButton;
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
    cxGrid1DBTableView1DB_VALUTE_TITLE: TcxGridDBColumn;
    cxGrid1DBTableView1DB_SPECIAL_SIGN: TcxGridDBColumn;
    cxGrid1DBTableView1DB_CODE_VALUTE: TcxGridDBColumn;
    cxGrid1DBTableView1DB_DATE_KURS: TcxGridDBColumn;
    cxGrid1DBTableView1DB_KURS: TcxGridDBColumn;
    cxGrid2DBTableView1DB_DATE_KURS: TcxGridDBColumn;
    cxGrid2DBTableView1DB_KURS: TcxGridDBColumn;
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure AddKursButtonClick(Sender: TObject);
    procedure EditKursButtonClick(Sender: TObject);
    procedure DelKursButtonClick(Sender: TObject);
    procedure DelValutaButtonClick(Sender: TObject);
    procedure AddValutaButtonClick(Sender: TObject);
    procedure EditValutaButtonClick(Sender: TObject);
    procedure SelectValutaButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    PDb_Handle :TISC_DB_HANDLE;
  public
    PRes       :Variant;
    constructor Create(Aparametr: TBankSimpleParam);reintroduce;
  end;

var
  MainForm: TMainForm;

implementation

uses BankValutaDM, BankValutaKursAdd,BankValutaAdd;

{$R *.dfm}
constructor TMainForm.Create(Aparametr: TBankSimpleParam);
begin
  inherited Create(Aparametr.Owner);
  BankValuta_DM := TBankValuta_DM.Create(Self);
  BankValuta_DM.DB.Handle:=Aparametr.DB_Handle;
//******************************************************************************
  BankValuta_DM.ValutaDSet.Close;
  BankValuta_DM.ValutaKursDSet.Close;
  BankValuta_DM.ValutaDSet.SelectSQL.Text     := 'SELECT * FROM PUB_SP_VALUTE_SEL order by valute_title';
  BankValuta_DM.ValutaKursDSet.SelectSQL.Text := 'select * from pub_dt_valute_kurs a inner join pub_sp_valute b on a.id_valute=b.id_valute where a.id_valute=:id_valute order by date_kurs desc';
  BankValuta_DM.ValutaDSet.Open;
  BankValuta_DM.ValutaKursDSet.Open;
end;

procedure TMainForm.dxBarLargeButton4Click(Sender: TObject);
begin
//  if formStyle = fsMDIChild then Action := CaFree;
  Close;
end;

procedure TMainForm.AddKursButtonClick(Sender: TObject);
var
  ViewForm : TBankValutaKursAddForm;
  id : Integer;
begin
  ViewForm := TBankValutaKursAddForm.Create(Self);
  ViewForm.cxLabelValuta.Caption := BankValuta_DM.ValutaDSet['VALUTE_TITLE'];;
  ViewForm.cxKurs.Text           := '';
  ViewForm.cxDateEdit.Text       := '';
  ViewForm.ShowModal;

  if (ViewForm.ModalResult = mrOk) then
  begin
    //**проверка на то, что до этого с такой же валютой курс не был введен на эту дату**//
    //*********************************************************************************//
    BankValuta_DM.TransWrite.StartTransaction;
    BankValuta_DM.StoredProc.StoredProcName                 := 'PUB_DT_VALUTE_KURS_UPD';
    BankValuta_DM.StoredProc.ParamByName('is_upd').Value    := 0 ;
    BankValuta_DM.StoredProc.ParamByName('id_valute').Value := BankValuta_DM.ValutaDSet['id_valute'];
    BankValuta_DM.StoredProc.ParamByName('KURS').Value      := ViewForm.cxKurs.Value;
    BankValuta_DM.StoredProc.ParamByName('DATE_KURS').Value := ViewForm.cxDateEdit.Date;
    BankValuta_DM.StoredProc.ExecProc;
    BankValuta_DM.TransWrite.Commit;
    id := BankValuta_DM.StoredProc.ParamByName('ID_KURS_VALUTE_').Value;
    BankValuta_DM.ValutaKursDSet.Close;
    BankValuta_DM.ValutaKursDSet.Open;
    BankValuta_DM.ValutaKursDSet.Locate('ID_KURS', IntToStr(id),[]);
  end;
end;

procedure TMainForm.EditKursButtonClick(Sender: TObject);
var
  ViewForm : TBankValutaKursAddForm;
  id : Integer;
  date_old : TDate;

begin
  ViewForm := TBankValutaKursAddForm.Create(Self);
  ViewForm.cxLabelValuta.Caption := BankValuta_DM.ValutaDSet['VALUTE_TITLE'];
  ViewForm.cxKurs.Value          := BankValuta_DM.ValutaKursDSet['KURS'];
  ViewForm.cxDateEdit.Date       := BankValuta_DM.ValutaKursDSet['DATE_KURS'];
  ViewForm.is_upd := 1;
  ViewForm.date_old := BankValuta_DM.ValutaKursDSet['DATE_KURS'];
  ViewForm.ShowModal;

  if (ViewForm.ModalResult = mrOk) then
  begin
    //**проверка на то, что до этого с такой же валютой курс не был введен на эту дату**//

    //*********************************************************************************//
    id := BankValuta_DM.ValutaKursDSet['ID_KURS'];
    BankValuta_DM.TransWrite.StartTransaction;
    BankValuta_DM.StoredProc.StoredProcName                 := 'PUB_DT_VALUTE_KURS_UPD';
    BankValuta_DM.StoredProc.ParamByName('is_upd').Value    := 1 ;
    BankValuta_DM.StoredProc.ParamByName('id_valute').Value := BankValuta_DM.ValutaDSet['id_valute'];
    BankValuta_DM.StoredProc.ParamByName('KURS').Value      := ViewForm.cxKurs.Value;
    BankValuta_DM.StoredProc.ParamByName('DATE_KURS').Value := ViewForm.cxDateEdit.Date;
    BankValuta_DM.StoredProc.ExecProc;
    BankValuta_DM.TransWrite.Commit;
    BankValuta_DM.ValutaKursDSet.Close;
    BankValuta_DM.ValutaKursDSet.Open;
    BankValuta_DM.ValutaKursDSet.Locate('ID_KURS', IntToStr(id),[]);
  end;
end;

procedure TMainForm.DelKursButtonClick(Sender: TObject);
begin
  if MessageDlg('¬и д≥йсно бажаЇте вилучити курс валюти?',mtConfirmation,[mbYes, mbNo],0)=mrYes then
   begin
    try
      BankValuta_DM.TransWrite.StartTransaction;
      BankValuta_DM.StoredProc.StoredProcName:='PUB_DT_VALUTE_KURS_DEL';
      BankValuta_DM.StoredProc.ParamByName('id_kurs').Value:=BankValuta_DM.ValutaKursDSet['id_kurs'];
      BankValuta_DM.StoredProc.ExecProc;
      BankValuta_DM.TransWrite.Commit;
      BankValuta_DM.ValutaKursDSet.close;
      BankValuta_DM.ValutaKursDSet.OPen;
    except on E:Exception do
     begin
       MessageDlg('не можна видалити цей запис', mtError, [mbOK],0);
       BankValuta_DM.TransWrite.Rollback;
     end;
    end;
   end;
end;

procedure TMainForm.DelValutaButtonClick(Sender: TObject);
begin
  if MessageDlg('¬и д≥йсно бажаЇте вилучити валюту?',mtConfirmation,[mbYes, mbNo],0)=mrYes then
   begin
    try
      BankValuta_DM.TransWrite.StartTransaction;
      BankValuta_DM.StoredProc.StoredProcName:='PUB_SP_VALUTE_DELETE';
      BankValuta_DM.StoredProc.ParamByName('ID_VALUTE').Value:=BankValuta_DM.ValutaDSet['ID_VALUTE'];
      BankValuta_DM.StoredProc.ExecProc;
      BankValuta_DM.TransWrite.Commit;
      BankValuta_DM.ValutaDSet.Close;
      BankValuta_DM.ValutaKursDSet.Close;
      BankValuta_DM.ValutaDSet.Open;
      BankValuta_DM.ValutaKursDSet.Open;
    except on E:Exception do
     begin
       MessageDlg('не можна видалити цей запис', mtError, [mbOK],0);
       BankValuta_DM.TransWrite.Rollback;
     end;
    end;
   end;
end;

procedure TMainForm.AddValutaButtonClick(Sender: TObject);
var
  ViewForm : TBankValutaAddForm;
  id : Integer;
begin
  ViewForm := TBankValutaAddForm.Create(Self);
  ViewForm.TitleValuteTextEdit.Text := '';
  ViewForm.CodeValuteTextEdit.Text  := '';
  ViewForm.SpecialSignTextEdit.Text := '';
  ViewForm.ShowModal;

  if (ViewForm.ModalResult = mrOk) then
  begin
    BankValuta_DM.TransWrite.StartTransaction;
    BankValuta_DM.StoredProc.StoredProcName                    := 'PUB_SP_VALUTE_INSERT';
    BankValuta_DM.StoredProc.ParamByName('CODE_VALUTE').Value  := ViewForm.CodeValuteTextEdit.Text;
    BankValuta_DM.StoredProc.ParamByName('VALUTE_TITLE').Value := ViewForm.TitleValuteTextEdit.Text;
    BankValuta_DM.StoredProc.ParamByName('SPECIAL_SIGN').Value := ViewForm.SpecialSignTextEdit.Text;
    BankValuta_DM.StoredProc.ExecProc;
    BankValuta_DM.TransWrite.Commit;
    id := BankValuta_DM.StoredProc.ParamByName('ID_VALUTE').Value;
    BankValuta_DM.ValutaDSet.Close;
    BankValuta_DM.ValutaKursDSet.Close;
    BankValuta_DM.ValutaDSet.Open;
    BankValuta_DM.ValutaKursDSet.Open;
    BankValuta_DM.ValutaDSet.Locate('ID_VALUTE', IntToStr(id),[]);
  end;
end;

procedure TMainForm.EditValutaButtonClick(Sender: TObject);
var
  ViewForm : TBankValutaAddForm;
  id : Integer;
begin
  ViewForm := TBankValutaAddForm.Create(Self);
  ViewForm.TitleValuteTextEdit.Text := BankValuta_DM.ValutaDSet['VALUTE_TITLE'];
  ViewForm.CodeValuteTextEdit.Text  := BankValuta_DM.ValutaDSet['CODE_VALUTE'];

  if (BankValuta_DM.ValutaDSet['SPECIAL_SIGN']<> null) then
    ViewForm.SpecialSignTextEdit.Text := BankValuta_DM.ValutaDSet['SPECIAL_SIGN']
  else
    ViewForm.SpecialSignTextEdit.Text := '';

  ViewForm.ShowModal;

  if (ViewForm.ModalResult = mrOk) then
  begin
    id := BankValuta_DM.ValutaDSet['ID_VALUTE'];
    BankValuta_DM.TransWrite.StartTransaction;
    BankValuta_DM.StoredProc.StoredProcName                    := 'PUB_SP_VALUTE_UPDATE';
    BankValuta_DM.StoredProc.ParamByName('ID_VALUTE').Value    := BankValuta_DM.ValutaDSet['ID_VALUTE'];
    BankValuta_DM.StoredProc.ParamByName('CODE_VALUTE').Value  := ViewForm.CodeValuteTextEdit.Text;
    BankValuta_DM.StoredProc.ParamByName('VALUTE_TITLE').Value := ViewForm.TitleValuteTextEdit.Text;
    BankValuta_DM.StoredProc.ParamByName('SPECIAL_SIGN').Value := ViewForm.SpecialSignTextEdit.Text;
    BankValuta_DM.StoredProc.ExecProc;
    BankValuta_DM.TransWrite.Commit;
    id := BankValuta_DM.StoredProc.ParamByName('ID_VALUTE').Value;
    BankValuta_DM.ValutaDSet.Close;
    BankValuta_DM.ValutaKursDSet.Close;
    BankValuta_DM.ValutaDSet.Open;
    BankValuta_DM.ValutaKursDSet.Open;
    BankValuta_DM.ValutaDSet.Locate('ID_VALUTE', IntToStr(id),[]);
  end;
end;

procedure TMainForm.SelectValutaButtonClick(Sender: TObject);
begin
  PRes   := VarArrayCreate([0,3], varVariant);
  PRes[0]:= BankValuta_DM.ValutaDSet['ID_VALUTE'];
  PRes[1]:= BankValuta_DM.ValutaDSet['VALUTE_TITLE'];
  PRes[2]:= BankValuta_DM.ValutaDSet['CODE_VALUTE'];
  ModalResult := mrOk;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if formStyle = fsMDIChild then Action := CaFree else    BankValuta_DM.Free;
end;

end.
