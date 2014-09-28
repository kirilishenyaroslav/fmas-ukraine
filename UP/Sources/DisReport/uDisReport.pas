unit uDisReport;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
    frxClass, frxDBSet, StdCtrls, cxTextEdit, cxControls, cxContainer,
    cxEdit, cxLabel, NagScreenUnit, Registry;

type
    TfrmDisReport = class(TForm)
        Database: TpFIBDatabase;
        pFIBTransaction1: TpFIBTransaction;
        pFIBDataSet1: TpFIBDataSet;
        frxDBDataset1: TfrxDBDataset;
        Button1: TButton;
        Button2: TButton;
        Button3: TButton;
        DataSetFooter: TpFIBDataSet;
        frxDBDataset2: TfrxDBDataset;
        DataSetInfo: TpFIBDataSet;
        frxDBDataset3: TfrxDBDataset;
        cxLabel1: TcxLabel;
        SizeFont: TcxTextEdit;
    frxReport1: TfrxReport;
        procedure Button3Click(Sender: TObject);
        procedure Button1Click(Sender: TObject);
        procedure Button2Click(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    frmDisReport: TfrmDisReport;

procedure GetExtReport(DBHandle: TISC_DB_HANDLE; id_order: Int64); stdcall;
exports GetExtReport;

implementation

{$R *.dfm}
uses BaseTypes;

procedure GetExtReport(DBHandle: TISC_DB_HANDLE; id_order: Int64); stdcall;
var
    frm: TfrmDisReport;
    reg: TRegistry;
begin
    frm := TfrmDisReport.Create(nil);
    frm.Database.Handle := DBHandle;
    frm.pFIBDataSet1.ParamByName('ID_ORDER').AsInt64 := id_order;
    frm.DataSetFooter.ParamByName('ID_ORDER').AsInt64 := id_order;
    frm.DataSetInfo.ParamByName('ID_ORDER').AsInt64 := id_order;

    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\ASUP\DisReport\', False) then
        begin
            frm.SizeFont.Text := reg.ReadString('f');
        end
    finally
        reg.Free;
    end;

    frm.ShowModal;
//    frm.Free;
end;


procedure TfrmDisReport.Button3Click(Sender: TObject);
var reg: TRegistry;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if reg.OpenKey('\Software\ASUP\DisReport\', true) then
        begin
            reg.writeString('f', SizeFont.Text);
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;

    ModalResult:=mrNo;

end;

procedure TfrmDisReport.Button1Click(Sender: TObject);
var SelectSP: TpFIBDataSet;
    reg: TRegistry;
begin
    if SizeFont.Text = ''
        then
    begin
        agShowMessage('Введіть розмір шрифту на друку!');
        SizeFont.SetFocus;
        SizeFont.Style.Color := clRed;
    end
    else
    begin
        NagScreen := TNagScreen.Create(Application.MainForm);
        NagScreen.Show;
        NagScreen.SetStatusText('Чекайте! Йде обробка даних для звіту');

        Button1.Enabled := True;
        frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Reports\Up\DisReport.fr3', true);

        SelectSP := TpFibDataSet.Create(self);
        SelectSP.Database := Database;
        SelectSP.Transaction := pFIBTransaction1;
        SelectSP.Close;
        SelectSP.SelectSQL.Text := 'SELECT * FROM INI_ASUP_CONSTS';
        SelectSP.Open;
        frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Reports\Up\DisReport.fr3', true);
        frxReport1.Variables['ORGANIZATION'] := '''' + SelectSP.FieldByName('FIRM_NAME').AsString + '''';
        frxReport1.Variables['CITY'] := '''' + SelectSP.FieldByName('CITY').AsString + '''';
        SelectSP.Close;

        frxReport1.Variables['font_doc'] := StrToInt(SizeFont.Text);

        SelectSP.Free;

        NagScreen.Free;

        if (GetAsyncKeyState(VK_SHIFT) and $8000) <> 0 then frxReport1.DesignReport else frxReport1.ShowReport();
        Button1.Enabled := True;

        reg := TRegistry.Create;
        try
            reg.RootKey := HKEY_CURRENT_USER;
            if reg.OpenKey('\Software\ASUP\DisReport\', true) then
            begin
                reg.writeString('f', SizeFont.Text);
                reg.CloseKey;
            end
        finally
            reg.Free;
        end;

    end;
end;

procedure TfrmDisReport.Button2Click(Sender: TObject);
var SelectSP: TpFIBDataSet;
    reg: TRegistry;
begin
    if SizeFont.Text = ''
        then
    begin
        agShowMessage('Введіть розмір шрифту на друку!');
        SizeFont.SetFocus;
        SizeFont.Style.Color := clRed;
    end
    else
    begin
        NagScreen := TNagScreen.Create(Application.MainForm);
        NagScreen.Show;
        NagScreen.SetStatusText('Чекайте! Йде обробка даних для звіту');

        Button1.Enabled := True;
        frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Reports\Up\DisReport.fr3', true);

        SelectSP := TpFibDataSet.Create(self);
        SelectSP.Database := Database;
        SelectSP.Transaction := pFIBTransaction1;
        SelectSP.Close;
        SelectSP.SelectSQL.Text := 'SELECT * FROM INI_ASUP_CONSTS';
        SelectSP.Open;
        frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName) + '\Reports\Up\DisReport.fr3', true);
        frxReport1.Variables['ORGANIZATION'] := '''' + SelectSP.FieldByName('FIRM_NAME').AsString + '''';
        frxReport1.Variables['CITY'] := '''' + SelectSP.FieldByName('CITY').AsString + '''';
        SelectSP.Close;

        frxReport1.Variables['font_doc'] := StrToInt(SizeFont.Text);

        SelectSP.Free;

        NagScreen.Free;

        frxReport1.PrepareReport();
        frxReport1.Print;
        Button1.Enabled := True;

        reg := TRegistry.Create;
        try
            reg.RootKey := HKEY_CURRENT_USER;
            if reg.OpenKey('\Software\ASUP\DisReport\', true) then
            begin
                reg.writeString('f', SizeFont.Text);
                reg.CloseKey;
            end
        finally
            reg.Free;
        end;

    end;
end;

end.

