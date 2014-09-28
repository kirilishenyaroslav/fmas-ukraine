unit uPremiaOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, uCommonSp, uFormControl, Buttons, Grids, Spin,
  StdCtrls, SpComboBox, DBGrids, ExtCtrls, Mask, CheckEditUnit, ComCtrls,
  uFControl, uLabeledFControl, uSpravControl, uDateControl, uEnumControl,
  uCharControl, uIntControl, uBoolControl, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, ibase, uSelectForm, uFloatControl,
  ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, uActionControl, uLogicCheck,
  uSimpleCheck, qFTools, fmPremiaOrderUnit, uShtatUtils;

    type
    TPremiaOrder = class(TSprav)
    private
     //   IsConnected: Boolean;
        Form: TfmPremiaOrder;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
    end;

    function CreateSprav: TSprav;stdcall;
    exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TPremiaOrder.Create;
end;

constructor TPremiaOrder.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('Id_Order_Type', ftInteger);
    Input.FieldDefs.Add('Id_Order', ftInteger);
    Input.FieldDefs.Add('Date_Order', ftDate);
    Input.FieldDefs.Add('SpMode', ftInteger);
    Input.FieldDefs.Add('Num_Item', ftInteger);
    Input.FieldDefs.Add('Sub_Item', ftInteger);
    Input.FieldDefs.Add('Id_Order_Group', ftInteger);
    Input.FieldDefs.Add('Intro', ftString, 4096);

    Output.FieldDefs.Add('New_Id_Order', ftInteger);
end;

destructor TPremiaOrder.Destroy;
begin
    inherited Destroy;
end;

procedure TPremiaOrder.Show;
var
    hnd : Integer;
    Mode : TFormMode;
begin
    Form := TfmPremiaOrder.Create(Application.MainForm);

    Form.LocalReadTransaction.Active := False;
    Form.LocalWriteTransaction.Active := False;

    if Form.LocalDatabase.Connected then Form.LocalDatabase.Close;

    hnd := Input['DBHANDLE'];
    Form.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

    case Input['SpMode'] of
        1 : Mode := fmAdd;
        2 : Mode := fmModify;
        3 : Mode := fmInfo;
    end;

    Form.dmShtatUtils := TdmShtatUtils.Create(Form, Integer(Form.LocalDatabase.Handle), Input['Date_Order']);

    fmPremiaOrder := Form;

    Form.IDOrder := Input['Id_Order'];
    Form.DateOrder := Input['Date_Order'];

    Form.FormControl.Prepare(Form.LocalDatabase, Mode, Input['Id_Order'], 0);

    if not VarIsNull(Input['ID_ORDER_TYPE']) then
        Form.FormControl.InsertSQL.Text := StringReplace(Form.FormControl.InsertSQL.Text, ':ID_ORDER_TYPE', IntToStr(Input['ID_ORDER_TYPE']), []);

    if not VarIsNull(Input['NUM_ITEM']) then
        Form.FormControl.InsertSQL.Text := StringReplace(Form.FormControl.InsertSQL.Text, ':NUM_ITEM', IntToStr(Input['NUM_ITEM']), []);

    if not VarIsNull(Input['SUB_ITEM']) then
        Form.FormControl.InsertSQL.Text := StringReplace(Form.FormControl.InsertSQL.Text, ':SUB_ITEM', IntToStr(Input['SUB_ITEM']), []);

    if not VarIsNull(Input['ID_ORDER_GROUP']) then
        Form.FormControl.InsertSQL.Text := StringReplace(Form.FormControl.InsertSQL.Text, ':ID_ORDER_GROUP', IntToStr(Input['ID_ORDER_GROUP']), []);

    if not VarIsNull(Input['INTRO']) then
        Form.FormControl.InsertSQL.Text := StringReplace(Form.FormControl.InsertSQL.Text, ':INTRO', QuotedStr(Input['INTRO']), []);

    Form.ShowModal;

    if Form.IdOrder <> -1 then begin
        Output.Open;
        Output.Append;
        Output['New_Id_Order'] := Form.IdOrder;
        Output.Post;
    end;

    Form.Free;
end;

end.
