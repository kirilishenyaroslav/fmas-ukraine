unit uSelPochas;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
    cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls, cxButtons,
    ExtCtrls, uFControl, uLabeledFControl, uCharControl, uPochasDis,
    FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, uPochasDisAdd,
    cxTextEdit;

type
    TSelPochasForm = class(TForm)
        Panel1: TPanel;
        cxButton1: TcxButton;
        cxButton2: TcxButton;
        cxButton3: TcxButton;
        PochasGridView: TcxGridDBTableView;
        PochasGridLevel1: TcxGridLevel;
        PochasGrid: TcxGrid;
        PochasGridViewDBColumn1: TcxGridDBColumn;
        PochasGridViewDBColumn2: TcxGridDBColumn;
        PochasGridViewDBColumn3: TcxGridDBColumn;
        PochasGridViewDBColumn4: TcxGridDBColumn;
        PochasGridViewDBColumn5: TcxGridDBColumn;
        PochasGridViewDBColumn6: TcxGridDBColumn;
        PochasGridViewDBColumn7: TcxGridDBColumn;
        PochasGridViewDBColumn8: TcxGridDBColumn;
        DSPochas: TDataSource;
        DSetPochas: TpFIBDataSet;
        ReadTr: TpFIBTransaction;
        PochasGridViewDBColumn9: TcxGridDBColumn;
        cxStyleRepository1: TcxStyleRepository;
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
        cxStyle15: TcxStyle;
        cxStyle16: TcxStyle;
        cxStyle17: TcxStyle;
        cxStyle18: TcxStyle;
        cxStyle19: TcxStyle;
        cxStyle20: TcxStyle;
        cxStyle21: TcxStyle;
        cxStyle22: TcxStyle;
        cxStyle23: TcxStyle;
        cxStyle24: TcxStyle;
        cxStyle25: TcxStyle;
        cxStyle26: TcxStyle;
        cxStyle27: TcxStyle;
        cxStyle28: TcxStyle;
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        SearchEdit: TEdit;
        Label2: TLabel;
        procedure cxButton1Click(Sender: TObject);
        procedure cxButton2Click(Sender: TObject);
        procedure cxButton3Click(Sender: TObject);
        procedure PochasGridViewDblClick(Sender: TObject);
        procedure PochasGridViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
    { Private declarations }
    public
        date_search: tdate;
    end;

var
    SelPochasForm: TSelPochasForm;

implementation

uses UpKernelUnit;
{$R *.dfm}

procedure TSelPochasForm.cxButton1Click(Sender: TObject);
var
    s: string;
begin

    if (SearchEdit.Text = '') or (VarIsNull(SearchEdit.Text)) then
    begin
        PochasGridView.DataController.DataSet.Filtered := False;
    end
    else
    begin
        try
            PochasGridView.DataController.DataSet.Filtered := False;
            PochasGridView.DataController.DataSet.Filter := 'UPPER(FIO) LIKE ''%' +
                AnsiUpperCase(SearchEdit.Text) + '%''';
            PochasGridView.DataController.DataSet.Filtered := True;
            PochasGridView.ViewData.Expand(False);
            PochasGridView.DataController.SelectRows(0, 0);
        except
        end;
    end;
end;

procedure TSelPochasForm.cxButton2Click(Sender: TObject);
begin
    SearchEdit.Text := '';
end;

procedure TSelPochasForm.cxButton3Click(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TSelPochasForm.PochasGridViewDblClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TSelPochasForm.PochasGridViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift))
        then
    begin
        ShowInfo(DSetPochas);
    end;
end;

end.
