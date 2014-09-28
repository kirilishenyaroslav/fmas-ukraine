unit uPlanHolidayOrderMain;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, RxMemDS, uCommonSp, uFormControl, Buttons, Grids, Spin,
    StdCtrls, DBGrids, ExtCtrls, Mask,  ComCtrls,
    uFControl, uLabeledFControl, uSpravControl, uDateControl, uEnumControl,
    uCharControl, uIntControl, uBoolControl, FIBDatabase, pFIBDatabase,
    FIBDataSet, pFIBDataSet, ibase, uFloatControl,
    ActnList, cxStyles, uActionControl, uLogicCheck,
    uSimpleCheck, qFTools, uPlanHolidayOrder;

type
    TPlanHolidayOrder = class(TSprav)
    private
        IsConnected : Boolean;
        Form : TfmPlanHolidayOrder;
    public
        constructor Create;
        destructor Destroy; override;
        procedure Show; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation

function CreateSprav: TSprav;
begin
    Result := TPlanHolidayOrder.Create;
end;

constructor TPlanHolidayOrder.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('Id_Order_Type', ftInteger);
    Input.FieldDefs.Add('Id_Order', ftInteger);
    Input.FieldDefs.Add('SpMode', ftInteger);
    Input.FieldDefs.Add('Date_Order', ftDate);
    Input.FieldDefs.Add('Num_Item', ftInteger);
    Input.FieldDefs.Add('Sub_Item', ftInteger);
    Input.FieldDefs.Add('Id_Order_Group', ftInteger);
    Input.FieldDefs.Add('Intro', ftString, 4096);

    Output.FieldDefs.Add('New_Id_Order', ftInteger);
end;

destructor TPlanHolidayOrder.Destroy;
begin
    inherited Destroy;
end;

procedure TPlanHolidayOrder.Show;
var
    hnd : Integer;
    Mode : TFormMode;
begin
    Form := TfmPlanHolidayOrder.Create(Application.MainForm);

    Form.LocalReadTransaction.Active := False;
    Form.LocalWriteTransaction.Active := False;

    if Form.LocalDatabase.Connected then Form.LocalDatabase.Close;

    hnd := Input['DBHANDLE'];
    Form.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

    case Input['SpMode'] of
        1: Mode := fmAdd;
        2: Mode := fmModify;
        3: Mode := fmInfo;
    end;

    fmPlanHolidayOrder := Form;

    if Mode = fmAdd then begin
        Form.LocalWriteTransaction.StartTransaction;

        Form.CreateOrderQuery.ParamByName('Id_Order_Type').AsInteger := Input['Id_Order_Type'];
        Form.CreateOrderQuery.ParamByName('Num_Item').AsInteger  := Input['Num_Item'];
        Form.CreateOrderQuery.ParamByName('Sub_Item').AsInteger := Input['Sub_Item'];
        Form.CreateOrderQuery.ParamByName('Id_Order_Group').AsInteger := Input['Id_Order_Group'];

        if not VarIsNull(Input['Intro']) then
            Form.CreateOrderQuery.ParamByName('Intro').AsString := Input['Intro'];

        Form.CreateOrderQuery.Open;

        if not VarIsNull(Form.CreateOrderQuery['Id_Order']) then
            Form.IdOrder := Form.CreateOrderQuery['Id_Order'];

        Form.LocalWriteTransaction.Commit;
    end
    else
        Form.IdOrder := Input['Id_Order'];

    Form.SelectQuery.ParamByName('ID_ORDER').AsInteger := Form.IdOrder;
    Form.DateOrder := Input['Date_Order'];

    Form.SelectQuery.Open;

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
