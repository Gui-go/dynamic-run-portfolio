

# Data Stores:

resource "google_discovery_engine_data_store" "tf_ds_personal" {
    project = var.proj_id
    location = "global"
    data_store_id = "${var.proj_name}-ds-personal-${var.release}"
    display_name = "Personal Data Store"
    industry_vertical = "GENERIC"
    content_config = "CONTENT_REQUIRED"
    solution_types = ["SOLUTION_TYPE_SEARCH"] # Vertex AI Search
    create_advanced_site_search = false
    # lifecycle {
    #     prevent_destroy = true
    # }
}

resource "google_discovery_engine_data_store" "tf_ds_ms" {
    project = var.proj_id
    location = "global"
    data_store_id = "${var.proj_name}-ds-ms-${var.release}"
    display_name = "MS References Data Store"
    industry_vertical = "GENERIC"
    content_config = "CONTENT_REQUIRED"
    solution_types = ["SOLUTION_TYPE_SEARCH"] # Vertex AI Search
    create_advanced_site_search = false
    # lifecycle {
    #     prevent_destroy = true
    # }
}

resource "google_discovery_engine_data_store" "tf_ds_gwr" {
    project = var.proj_id
    location = "global"
    data_store_id = "${var.proj_name}-ds-gwr-${var.release}"
    display_name = "GWR References Data Store"
    industry_vertical = "GENERIC"
    content_config = "CONTENT_REQUIRED"
    solution_types = ["SOLUTION_TYPE_SEARCH"] # Vertex AI Search
    create_advanced_site_search = false
    # lifecycle {
    #     prevent_destroy = true
    # }
}



# Search Engines:

resource "google_discovery_engine_search_engine" "tf_personal_searchengine" {
    depends_on = [google_discovery_engine_data_store.tf_ds_personal]
    project = var.proj_id
    engine_id = "${var.proj_name}-personal-se"
    display_name = "Personal Search Engine"
    collection_id = "default_collection"
    location = google_discovery_engine_data_store.tf_ds_personal.location
    industry_vertical = "GENERIC"
    data_store_ids = [google_discovery_engine_data_store.tf_ds_personal.data_store_id]
    common_config {
        company_name = "Guigo"
    }
    search_engine_config {
        search_add_ons = ["SEARCH_ADD_ON_LLM"]
    }
}


resource "google_discovery_engine_search_engine" "tf_ms_searchengine" {
    depends_on = [google_discovery_engine_data_store.tf_ds_ms]
    project = var.proj_id
    engine_id = "${var.proj_name}-ms-se"
    display_name = "MS Search Engine"
    collection_id = "default_collection"
    location = google_discovery_engine_data_store.tf_ds_ms.location
    industry_vertical = "GENERIC"
    data_store_ids = [google_discovery_engine_data_store.tf_ds_ms.data_store_id]
    common_config {
        company_name = "Guigo"
    }
    search_engine_config {
        search_add_ons = ["SEARCH_ADD_ON_LLM"]
    }
}

resource "google_discovery_engine_search_engine" "tf_gwr_searchengine" {
    depends_on = [google_discovery_engine_data_store.tf_ds_gwr]
    project = var.proj_id
    engine_id = "${var.proj_name}-gwr-se"
    display_name = "GWR Search Engine"
    collection_id = "default_collection"
    location = google_discovery_engine_data_store.tf_ds_gwr.location
    industry_vertical = "GENERIC"
    data_store_ids = [google_discovery_engine_data_store.tf_ds_gwr.data_store_id]
    common_config {
        company_name = "Guigo"
    }
    search_engine_config {
        search_add_ons = ["SEARCH_ADD_ON_LLM"]
    }
}
