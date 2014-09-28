unit Seriya;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, cxLookAndFeelPainters, cxLabel,
  StdCtrls, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit,
  FIBQuery, pFIBQuery, pFIBStoredProc, ExtCtrls, DB, FIBDataSet,
  pFIBDataSet;

type
  TfmSeriya = class(TForm)
    DB: TpFIBDatabase;
    TWr: TpFIBTransaction;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    Tr: TpFIBTransaction;
    Stored: TpFIBStoredProc;
    cxLabel3: TcxLabel;
    Timer1: TTimer;
    DS: TpFIBDataSet;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cxTextEdit2KeyPress(Sender: TObject; var Key: Char);
  private
    id_doc, ppp : int64;
    color_flag : boolean;
  public
    { Public declarations }
  end;

function kassa_inst_seriya(ao : Tcomponent; d : TpfibDataBase; id, pr : int64; s, n_s, nn, dd : string) : boolean;

implementation

{$R *.dfm}

function kassa_inst_seriya(ao : Tcomponent; d : TpfibDataBase; id, pr : int64; s, n_s, nn, dd : string) : boolean;
var
    T : TfmSeriya;
begin
    T                       := TfmSeriya.Create(Ao);
    T.DB                    := D;
    T.Tr.DefaultDatabase    := T.DB;
    T.TWr.DefaultDatabase   := T.DB;
    T.DB.DefaultTransaction := T.Tr;

    T.DS.Database           := T.DB;
    T.DS.Transaction        := T.Tr;

    T.Tr.StartTransaction;
    T.ppp                   := pr;


    T.id_doc                := id;
    T.color_flag            := true;

    T.cxTextEdit1.Text      := s;
    T.cxTextEdit2.Text      := n_s;
    if (s <> '') or (n_s <> '') then
    begin
        T.cxLabel3.Caption      := 'Касовий ордер № ' + nn + ' від ' + dd + ' вже надруковано на бланку!';
        T.Color                 := RGB(255,0,0);
        T.cxLabel3.visible      := true;
    end else
    begin
        T.DS.Close;
        T.DS.SQLs.SelectSQL.Text := 'select * from KASSA_SYS';
        T.DS.Open;
        if pr = 1 then
        begin
            try T.cxTextEdit1.Text := T.DS.fbn('SERIYA').AsString;                  except T.cxTextEdit1.Text := '';   end;
            try T.cxTextEdit2.Text := IntToStr(T.DS.fbn('N_SERII').AsInteger + 1);  except T.cxTextEdit2.Text := '1';  end;
        end else
        begin
            try T.cxTextEdit1.Text := T.DS.fbn('SERIYA_R').AsString;                  except T.cxTextEdit1.Text := '';   end;
            try T.cxTextEdit2.Text := IntToStr(T.DS.fbn('N_SERII_R').AsInteger + 1);  except T.cxTextEdit2.Text := '1';  end;
        end;
        T.DS.Close;
    end;

    if T.ShowModal = mrOk then
    begin

        Result := true;
    end else
        Result := false;
    T.Free;
end;

procedure TfmSeriya.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure TfmSeriya.cxButton1Click(Sender: TObject);
begin
    if cxTextEdit1.Text = '' then
    begin
        showmessage('Ви не ввели серію!');
        cxTextEdit1.SetFocus;
        exit;
    end;
    if cxTextEdit2.Text = '' then
    begin
        showmessage('Ви не ввели номер!');
        cxTextEdit2.SetFocus;
        exit;
    end;

    Stored.Database    := DB;
    Stored.Transaction := TWr;
    TWr.StartTransaction;
    try
        Stored.StoredProcName := 'KASSA_UPDATE_SERIYA';
        Stored.ParamByName('D_ID_DOC').AsInt64      := id_doc;
        Stored.ParamByName('D_PR').AsInteger        := ppp;
        Stored.ParamByName('D_SERIYA').AsString     := cxTextEdit1.Text;
        Stored.ParamByName('D_N_SERII').AsString    := cxTextEdit2.Text;
        Stored.ExecProc;
        TWr.Commit;
    except on E:Exception do begin
        TWr.Rollback;
        ShowMessage(E.Message);
    end end;

    ModalResult := mrOk;
end;

procedure TfmSeriya.Timer1Timer(Sender: TObject);
begin
    if color_flag then
    begin
        cxLabel3.Style.Font.Color := clWhite;
        color_flag := false;
    end else
    begin
        cxLabel3.Style.Font.Color := clBlack;
        color_flag := true;
    end;
end;

procedure TfmSeriya.cxTextEdit2KeyPress(Sender: TObject; var Key: Char);
begin
    if (key > '9') or (key < '0') then key := Chr(0);
end;

end.
