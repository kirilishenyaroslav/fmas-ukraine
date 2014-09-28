unit PCardAttributesUnit;

interface
uses
    MainUnit, PersonalCommon, SpCommon, FieldControl, EditControl;

type TPCardProp = class(TObject)

        constructor Create;

    private FPropEditControl: TEditControl;

    public procedure AddData(FC_GROUP, FC_Property,
            FC_IntData, FC_StrData, FC_DateData: TFieldControl; ID_PCARD: Integer);

    public procedure UpdateData(FC_GROUP, FC_Property,
            FC_IntData, FC_StrData, FC_DateData: TFieldControl; ID_PCARD: Integer);


    end;


implementation

constructor TPCardProp.Create;
begin
    FPropEditControl := TEditControl.Create;
end;



procedure TPCardProp.AddData(FC_GROUP, FC_Property,
    FC_IntData, FC_StrData, FC_DateData: TFieldControl; ID_PCARD: Integer);
begin

    FPropEditControl.Add([FC_Group, FC_Property, FC_IntData, FC_StrData, FC_DateData]);

    PersonalCommon.WriteTransaction.StartTransaction;
    FPropEditControl.ExecProc('PCARD_AND_PROP_INSERT', [ID_PCARD]);
    PersonalCommon.WriteTransaction.Commit;

end;

procedure TPCardProp.UpdateData(FC_GROUP, FC_Property,
    FC_IntData, FC_StrData, FC_DateData: TFieldControl; ID_PCARD: Integer);
begin

    FPropEditControl.Add([FC_Group, FC_Property, FC_IntData, FC_StrData, FC_DateData]);

    PersonalCommon.WriteTransaction.StartTransaction;
    FPropEditControl.ExecProc('PCARD_AND_PROP_UPDATE', [ID_PCARD]);
    PersonalCommon.WriteTransaction.Commit;

end;



end.
