
typedef union cvt{
        char c[4];
        unsigned int value;
        int ivalue;
}CVT;
typedef union cvtf {
        char c[4];
        float value;
}CVTF;

typedef struct _git{
	short year;
	short days_from_jan1;
	short minute_of_day;
}GIT;

typedef struct it_list {
	GIT it;
	int n_ft;
	int *ft_vals;
	int n_lv;
	int *lv_vals;
	int *lv_vals1;
	struct ft_list *thelist;
	struct it_list *next;
}ITLIST;

typedef struct ft_list {
	int ft;
	int n_lv;
	int *lv_vals;
	int *lv_vals1;
	struct _GribRecordInqRecList *thelist;
	struct ft_list *next;
}FTLIST;

typedef struct tble2 {
        int  num;
        char *long_name;
        char *units;
        char *abrev;
}TBLE2;

typedef struct _ptableinfo {
	struct _ptableinfo *next;
	int center;
	int subcenter;
	int version;
	char *name;
	int pcount;
	TBLE2 *table;
} PtableInfo;

#define GRIBEOF  0
#define GRIBERROR -1
#define GRIBOK 1


typedef struct _GribFileRecord GribFileRecord;
typedef struct _GribRecordInqRec GribRecordInqRec;
typedef struct _GribDimInqRec GribDimInqRec;
typedef struct _GribAttInqRec GribAttInqRec;
typedef struct _GribRecordInqRecList GribRecordInqRecList;
typedef struct _GribDimInqRecList GribDimInqRecList;
typedef struct _GribAttInqRecList GribAttInqRecList;
typedef struct _GribParamList GribParamList;
typedef struct _GribInternalVarList GribInternalVarList;
typedef struct _GribInternalVarRec GribInternalVarRec;
typedef struct _NclGribFVarRec      NclGribFVarRec;
typedef struct _NclGribCacheRec      NclGribCacheRec;
typedef struct _NclGribCacheList      NclGribCacheList;
typedef struct _GribOptions          GribOptions;

struct _NclGribCacheList {
	int grid_number;
	int has_gds;
	int grid_gds_tbl_index;
	int n_dims;
	int dimsizes[3];
	int n_entries;
	struct _NclGribCacheList *next;
	struct _NclGribCacheRec *thelist;
	struct _NclGribCacheRec *tail;
};

struct _NclGribCacheRec {
	struct _NclGribCacheRec *prev;
	struct _NclGribCacheRec *next;
	GribRecordInqRec *rec;
	NclMultiDValData thevalue;
};

struct _NclGribFVarRec {
        NclQuark var_name_quark;
        NclBasicDataTypes data_type;
	int 	doff;
        int     num_dimensions;
        int     dim_sizes[NCL_MAX_DIMENSIONS];
        int     file_dim_num[NCL_MAX_DIMENSIONS];
};
struct _GribInternalVarList {
	GribInternalVarRec *int_var;
	GribInternalVarList *next;
};

struct _GribInternalVarRec {
	NclQuark var_name_q;
	NclGribFVarRec var_info;
	NclMultiDValData value;
	int n_atts;
	GribAttInqRecList *theatts;
};




struct _GribParamList {
	int param_number;
	int grid_number;
	int grid_tbl_index;
	int has_gds;
	int gds_type;
	int grid_gds_tbl_index;
	int n_entries;
	int time_range_indicator;
	int time_period;      /* 0 unless  ave,diff, or acc: then p2 - p1 */
	int time_unit_indicator;
	int level_indicator;
	GIT minimum_it;
	NclGribFVarRec var_info;
	NrmQuark aux_coords[2];
	int yymmddhh_isatt;
	NclOneDValCoordData yymmddhh;
	GIT *it_vals;
	int forecast_time_isatt;
	NclOneDValCoordData forecast_time;
	int levels_isatt;
	int levels_has_two;
	NclOneDValCoordData levels;
	NclMultiDValData levels0;
	NclMultiDValData levels1;
	GribRecordInqRecList *thelist;
	int n_atts;
	GribAttInqRecList *theatts;
	GribParamList *next;
};
struct _GribRecordInqRecList {
	GribRecordInqRec *rec_inq;
	GribRecordInqRecList *next;
};

struct _GribDimInqRecList {
	GribDimInqRec *dim_inq;
	GribDimInqRecList *next;
};

struct _GribAttInqRecList {
	GribAttInqRec *att_inq;
	GribAttInqRecList *next;
};

struct _GribRecordInqRec {
	NclQuark var_name_q;
	int param_number;
	TBLE2 *ptable_rec;
	int grid_tbl_index;
	int grid_number;
	int version;
	int rec_num;
	int center_ix;
/*
* This is the time offset from the beginning reference
* time of the parameter set. The units are set in
* the GribParamList structure
*/
	GIT initial_time;
	long time_offset;
	int time_period;      /* this is P2 - P1 -- the period for acc, avg and diff type records */
	int level_indicator;
	int level0;
	int level1;
	unsigned char *pds;
	int pds_size;
	char *var_name;
	NclQuark long_name_q;
	NclQuark units_q;
	unsigned int start;
	unsigned int bds_off;
	unsigned int bds_flags;
	unsigned int bds_size;
	int int_or_float;
	int has_gds;
	unsigned char *gds;
	unsigned int gds_off;
	unsigned int gds_size;
	int gds_type;
	int grid_gds_tbl_index;
	int interp_method;   /* 0 - linear ; 1 - cubic */
	int has_bms;
	unsigned int bms_off;
	unsigned int bms_size;
	NclMultiDValData the_dat;
};

struct _GribDimInqRec {
	int dim_number; /* assigned in order of occurance in grib record */
	int is_gds;
	int gds_size;
	unsigned char *gds;
	NclQuark dim_name;
	long size;
	int is_uv; /* only applicable to staggered grids */
};
	
struct _GribAttInqRec {
	NclQuark name;
	NclMultiDValData thevalue;
};

#define GRIB_THINNED_GRID_INTERPOLATION_OPT 0
#define GRIB_NUM_OPTIONS 1

struct _GribOptions {
	NclQuark name;
	NclBasicDataTypes data_type;
	int n_values;
	void *values;
};

struct _GribFileRecord {
NclQuark	file_path_q;
int		wr_status;
int		n_vars;
GribParamList	*var_list;
int 		n_internal_vars;
GribInternalVarList	*internal_var_list;
int		total_dims;
int		n_scalar_dims;
GribDimInqRecList *scalar_dims;
int		n_it_dims;
GribDimInqRecList *it_dims;
int		n_ft_dims;
GribDimInqRecList *ft_dims;
int		n_lv_dims;
GribDimInqRecList *lv_dims;
int		n_grid_dims;
GribDimInqRecList *grid_dims;
NclGribCacheList *grib_grid_cache;
int             n_options;
GribOptions     *options;
};

typedef int (*GribUnPackData)(
#if NhlNeedProto
FILE */*fd*/,
void** /* output */,
void**  /* missing */,
GribRecordInqRec* /* therec */,
GribParamList* /* thevarrec */
#endif
);	

typedef void (*GribGetGDSGrid)(
#if NhlNeedProto
GribParamList*, /* thevarrec */
float**,
int *,
int **,
float **,
int *,
int **,
GribAttInqRecList ** /*lat_att_list*/,
int * /*nlatatts*/,
GribAttInqRecList ** /*lon_att_list*/,
int * /*lonatts*/
#endif
);	
typedef void (*GribGetGrid)(
#if NhlNeedProto
GribParamList*, /* thevarrec */
float**,
int *,
int **,
float **,
int *,
int **
#endif
);	

typedef void (*GribGetGridAtts)(
#if NhlNeedProto
GribParamList*,
GribAttInqRecList ** /*lat_att_list*/,
int * /*nlatatts*/,
GribAttInqRecList ** /*lon_att_list*/,
int * /*lonatts*/
#endif
);

typedef struct gridinfo {
	GribUnPackData un_pack;
	GribGetGrid get_grid;
	GribGetGridAtts get_grid_atts;
	char *grid_name;
}GridInfoRecord;
typedef struct gridgdsinfo {
	GribUnPackData un_pack;
	GribGetGDSGrid get_gds_grid;
	char *grid_name;
}GridGDSInfoRecord;

extern int CnvtToDecimal(
#if     NhlNeedProto
int /*n_bytes*/,
unsigned char * /*val*/
#endif
);

extern unsigned int UnsignedCnvtToDecimal(
#if     NhlNeedProto
int /*n_bytes*/,
unsigned char * /*val*/
#endif
);

extern int Is_UV(
#if     NhlNeedProto
int param_number
#endif
);

typedef struct _GribTable {
	int index;
	char *name;
} GribTable;

#define DEFAULT_MISSING_FLOAT ((NclTypeClass)nclTypefloatClass)->type_class.default_mis.floatval
#define DEFAULT_MISSING_INT ((NclTypeClass)nclTypeintClass)->type_class.default_mis.intval
