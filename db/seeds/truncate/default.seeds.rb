DatabaseCleaner.clean_with :truncation, only: ['roles',
                                               'cs_attribute_weightings',
                                               'cloud_service_types',
                                               'operating_systems',
                                               'paas_categories',
                                               'saas_categories'
]