unit UPrintComand;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, StdCtrls, cxControls, cxContainer,
    cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxButtons, uCommonSp,
    FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, ibase, frxClass,
    frxDBSet;

type
    TfmPrintComand = class(TForm)
        PrintButton: TcxButton;
        CancelButton: TcxButton;
        cxComboBoxSelComand: TcxComboBox;
        Label1: TLabel;
        pFIBDatabaseCommand: TpFIBDatabase;
        DataSetSelPI: TpFIBDataSet;
        TransactionR: TpFIBTransaction;
        frxDBDatasetSablon: TfrxDBDataset;
    frxReportPrint: TfrxReport;
        procedure CancelButtonClick(Sender: TObject);
        procedure PrintButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    private
        id_order_comm: integer;
    public
        ResultArray: Variant;
    end;

var
    fmPrintComand: TfmPrintComand;
function ShowPrintComand(b_handle: TISC_DB_HANDLE; id_order_comand: integer): Integer;

implementation

uses PersonalCommon;
{$R *.dfm}

function ShowPrintComand(b_handle: TISC_DB_HANDLE; id_order_comand: integer): Integer;
var
    CPF: TfmPrintComand;
begin
    CPF := TfmPrintComand.Create(nil);
    CPF.pFIBDatabaseCommand.Handle := b_handle;
    CPF.id_order_comm := id_order_comand;

    CPF.cxComboBoxSelComand.ItemIndex := 0;

    CPF.pFIBDatabaseCommand.Connected := true;

    CPF.DataSetSelPI.Close;
    CPF.DataSetSelPI.SelectSQL.Text := 'select * from ASUP_COMAND_PRINT_F(' + IntToStr(CPF.id_order_comm) + ')';
    CPF.DataSetSelPI.Open;

    CPF.ShowModal;
    ShowPrintComand := CPF.ResultArray;
    CPF.Free;
end;

procedure TfmPrintComand.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmPrintComand.PrintButtonClick(Sender: TObject);
begin
    //ShowMessage('Не разработано!' + IntToStr(id_order_comm) + 'Человек=' + DataSetSelPI['FIO']);
    if cxComboBoxSelComand.ItemIndex = 0 then
    begin
        DataSetSelPI.Close;
        DataSetSelPI.SelectSQL.Text := 'select * from ASUP_COMAND_PRINT_F(' + IntToStr(id_order_comm) + ')';
        DataSetSelPI.Open;

        frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\ASUP' + '\' + 'Asup_print_posvid_pro_comand.fr3');
        if sDesignReport then frxReportPrint.DesignReport
        else frxReportPrint.ShowReport;
    end;
    if cxComboBoxSelComand.ItemIndex = 2 then
    begin
        frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\ASUP' + '\' + 'Asup_print_zvit_pro_comand.fr3');
        if sDesignReport then frxReportPrint.DesignReport
        else frxReportPrint.ShowReport;
    end;
    if cxComboBoxSelComand.ItemIndex = 1 then
    begin
        DataSetSelPI.Close;
        DataSetSelPI.SelectSQL.Text := 'select * from ASUP_COMAND_PRINT_F(' + IntToStr(id_order_comm) + ')';
        DataSetSelPI.Open;

        frxReportPrint.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\ASUP' + '\' + 'Asup_print_nakaz_pro_comand.fr3');
        frxReportPrint.Variables['Firm_Name'] := QuotedStr(Consts_Query['Firm_Name']);
        if sDesignReport then frxReportPrint.DesignReport
        else frxReportPrint.ShowReport;
    end;
    close;
end;

procedure TfmPrintComand.FormCreate(Sender: TObject);
begin
    cxComboBoxSelComand.ItemIndex := 1;
end;

end.

