unit uOtpuskAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uSpravControl, uDateControl, uFControl,
  uLabeledFControl, uCharControl, uIntControl, uFormControl, uInvisControl,
  uBoolControl, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  uMemoControl, ExtCtrls, cxCheckBox, cxTextEdit, ActnList;

type
  TfrmAddOtpusk = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_POST: TcxGridDBColumn;
    cxGrid1DBTableView1ID_MAN_HOLIDAY_FACT: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1HOLIDAY_BEG: TcxGridDBColumn;
    cxGrid1DBTableView1HOLIDAY_END: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    btnCancel: TBitBtn;
    DataSet: TpFIBDataSet;
    DataSource1: TDataSource;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    SpeedButton1: TSpeedButton;
    ActionList1: TActionList;
    okAction: TAction;
    procedure NameDismissionOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure okActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses uCommonSp, uOtpusk, qfTools;
{$R *.dfm}

procedure TfrmAddOtpusk.NameDismissionOpenSprav(Sender: TObject;
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
        sp.Input.FieldValues['DBHandle'] := Integer(TfrmOtpuskOrder(owner).Database.Handle);
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

procedure TfrmAddOtpusk.FormCreate(Sender: TObject);
begin
 DataSet.Database := TfrmOtpuskOrder(Owner).Database;
 DataSet.Transaction := TfrmOtpuskOrder(Owner).ReadTransaction;
 DataSet.Open;
end;

procedure TfrmAddOtpusk.btnOkClick(Sender: TObject);
begin
// if TfrmOtpuskOrder(Owner).Input['mode'] = 3 then Close;
// if DataSet.RecordCount = 0 then
// begin
//   ShowMessage('Необхідно вибрати особу для звілнення');
//   exit;
// end;
// if qFCheckAll(Self) then ModalResult := mrOk;
 ModalResult := mrOk;
end;

procedure TfrmAddOtpusk.FormDestroy(Sender: TObject);
begin
 DataSet.Close;
end;

procedure TfrmAddOtpusk.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
 btnOkClick(Self);
end;

procedure TfrmAddOtpusk.okActionExecute(Sender: TObject);
begin
      ModalResult:=mrOk;
end;

end.
