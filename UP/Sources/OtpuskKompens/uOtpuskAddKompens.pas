unit uOtpuskAddKompens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uSpravControl, uDateControl, uFControl,
  uLabeledFControl, uCharControl, uIntControl, uFormControl, uInvisControl,
  uBoolControl, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  uMemoControl, ExtCtrls;

type
  TfrmAddKompens = class(TForm)
    DataSet: TpFIBDataSet;
    DataSource1: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    cxGrid1DBTableView1USED_DAYS_COUNT: TcxGridDBColumn;
    cxGrid1DBTableView1DAYS_COUNT: TcxGridDBColumn;
    cxGrid1DBTableView1PERIOD_BEG: TcxGridDBColumn;
    cxGrid1DBTableView1PERIOD_END: TcxGridDBColumn;
    procedure NameDismissionOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses uCommonSp, uOtpuskKompens, qfTools;
{$R *.dfm}

procedure TfrmAddKompens.NameDismissionOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
    // создать справочник
    sp :=  GetSprav('asup\SpDismission');
    if sp <> nil then
    begin
        // заполнить входные параметры
        sp.Input.Append;
        sp.Input.FieldValues['DBHandle'] := Integer(TfrmOtpuskKompens(owner).Database.Handle);
        sp.Input.FieldValues['FormStyle'] := fsNormal;
        sp.Input.Post;
        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Dismission'];
            DisplayText := sp.Output['Name_Dismission'];

            if not VarIsNull(sp.Output['Kzot_St']) then
                DisplayText := DisplayText + ' ' + sp.Output['Kzot_St'];
        end;
        sp.Free;
    end;
end;

procedure TfrmAddKompens.FormCreate(Sender: TObject);
begin
 DataSet.Database := TfrmOtpuskKompens(Owner).Database;
 DataSet.Transaction := TfrmOtpuskKompens(Owner).ReadTransaction;
end;

procedure TfrmAddKompens.btnOkClick(Sender: TObject);
begin
 ModalResult := mrOk;
end;

procedure TfrmAddKompens.FormDestroy(Sender: TObject);
begin
 DataSet.Close;
end;

procedure TfrmAddKompens.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  btnOkClick(Self);
end;

end.
