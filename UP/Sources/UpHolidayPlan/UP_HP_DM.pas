unit UP_HP_DM;

interface

uses
    SysUtils, Classes, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
    FIBQuery, pFIBQuery;

type
    THP_DM = class(TDataModule)
        pFIBD_HP: TpFIBDatabase;
        pFIBT_Read: TpFIBTransaction;
        pFIBT_Write: TpFIBTransaction;
        pFIBDS_FIO: TpFIBDataSet;
        pFIBDS_HP_Full: TpFIBDataSet;
        pFIBQ_Delete: TpFIBQuery;
        pFIBDS_SelectPeople: TpFIBDataSet;
        pFIBQ_DeletePeople: TpFIBQuery;
        pFIBDS_GetIdSession: TpFIBDataSet;
        pFIBDS_GetPeriods: TpFIBDataSet;
        pFIBQ_AddForBuff: TpFIBQuery;
        pFIBDS_GetActBpl: TpFIBDataSet;
        pFIBQ_GeneratePeriods: TpFIBQuery;
        pFIBDS_AddHoliday: TpFIBDataSet;
        pFIBDS_Movings: TpFIBDataSet;
        pFIBDS_UsedEditAvaible: TpFIBDataSet;
        pFIB_CAN_ADD: TpFIBDataSet;
        pFIB_CAN_ADDCAN_ADD_HOL_PROP: TFIBSmallIntField;
        HistDataSet: TpFIBDataSet;
        HistDataSource: TDataSource;
        DSetGroupHoliday: TpFIBDataSet;
        DSGroupHoliday: TDataSource;
        pFIBDS_Consts: TpFIBDataSet;
    private
        { Private declarations }
    public
        { Public declarations }
    end;

implementation

{$R *.dfm}

end.

